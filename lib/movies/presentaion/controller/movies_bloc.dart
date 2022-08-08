import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:movies_app/core/utils/enums.dart';

import 'package:movies_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentaion/controller/movies_event.dart';
import 'package:movies_app/movies/presentaion/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPlayNowMoviesUseCase getPlayNowMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(
    this.getPlayNowMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getTopRatedMovies(event, emit) async {
    final result = await getTopRatedMoviesUseCase
        .call(const GetTopRatedMoviesParameters());
    result.fold(
        (failure) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: failure.message,
            )),
        (moviesList) => emit(state.copyWith(
              topRatedMovies: moviesList,
              topRatedState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getPopularMovies(event, emit) async {
    final result =
        await getPopularMoviesUseCase.call(const GetPopularMoviesParameters());
    result.fold(
        (failure) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: failure.message,
            )),
        (moviesList) => emit(state.copyWith(
              popularMovies: moviesList,
              popularState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getNowPlayingMovies(event, emit) async {
    final result =
        await getPlayNowMoviesUseCase.call(const GetPlayNowMoviesParameters());
    result.fold(
        (failure) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: failure.message,
            )),
        (moviesList) => emit(state.copyWith(
              nowPlayingMovies: moviesList,
              nowPlayingState: RequestState.loaded,
            )));
  }
}
