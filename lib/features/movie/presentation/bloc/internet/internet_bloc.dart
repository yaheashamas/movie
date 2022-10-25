import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:movies/features/movie/presentation/bloc/internet/internet_event.dart';
import 'package:movies/features/movie/presentation/bloc/internet/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InternetInitial()) {
    Connectivity().onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          add(ConnectedEvent());
        } else if (connectivityResult == ConnectivityResult.none) {
          add(NotConnectedEvent());
        }
      },
    );
    
    on<InternetEvent>(
      (event, emit) {
        if (event is ConnectedEvent) {
          emit(InternetConnected());
        } else if (event is NotConnectedEvent) {
          emit(InternetDisconnected());
        }
      },
    );
  }
}
