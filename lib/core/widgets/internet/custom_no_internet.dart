import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di.dart';
import 'package:movies/features/movie/presentation/bloc/internet/internet_bloc.dart';
import 'package:movies/features/movie/presentation/bloc/internet/internet_state.dart';

class CustomNoInternet extends StatelessWidget {
  const CustomNoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<InternetBloc>(),
      child: Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: MediaQuery.of(context).size.width,
              height: state is InternetConnected ? 0 : 25,
              color: Colors.red,
              child: const Center(
                child: Text(
                  "Please try check about your internet",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
