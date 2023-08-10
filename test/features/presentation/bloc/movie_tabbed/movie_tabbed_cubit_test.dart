// import 'package:mockito/mockito.dart';
// import 'package:movies/features/movie/domain/usecases/remote/get_coming_soon_use_case.dart';
// import 'package:movies/features/movie/domain/usecases/remote/get_playing_now_use_case.dart';
// import 'package:movies/features/movie/domain/usecases/remote/get_popular_use_case.dart';
// import 'package:movies/features/movie/presentation/bloc/movie_tabbed/movie_tabbed_cubit.dart';
// import 'package:movies/features/movie/presentation/bloc/movie_tabbed/movie_tabbed_state.dart';
// import 'package:test/test.dart';

// class GetPopularMock extends Mock implements GetPopularUseCase {}

// class GetPlayingNowMock extends Mock implements GetPlayingNowUseCase {}

// class GetComingSonMock extends Mock implements GetComingSonUseCase {}

// main() {
//   var getPopularMock;
//   var getPlayingNowMock;
//   var getComingSonMock;
//   MovieTabbedCubit movieTabbedCubit;

//   //initial
//   setUp(() {
//     getPopularMock = GetPopularMock();
//     getPlayingNowMock = GetPlayingNowMock();
//     getComingSonMock = GetComingSonMock();
//     movieTabbedCubit = MovieTabbedCubit(
//       getComingSonMock,
//       getPlayingNowMock,
//       getPopularMock,
//     );
//   });

//   //when done
//   tearDown(() {
//     movieTabbedCubit.close();
//   });

//   //first test
//   test("bloc should have inital state as [MovieTabbedInitial]", () {
//     expect(movieTabbedCubit.state.runtimeType, MovieTabbedInitial);
//   });
// }
