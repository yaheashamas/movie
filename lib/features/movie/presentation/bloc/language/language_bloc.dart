import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/config/common/constants/languages.dart';
import 'package:movies/core/language/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  static LanguageBloc get(context) => BlocProvider.of(context);

  LanguageBloc()
      : super(
          LanguageLoaded(
            Locale(Languages.languages[0].code),
          ),
        ) {
    on<ToggleLanguageEvent>((event, emit) {
      emit(LanguageLoaded(Locale(event.language.code)));
    });
  }
}
