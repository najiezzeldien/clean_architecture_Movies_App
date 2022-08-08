import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendationUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase
        .call(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (failure) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              movieDetailsMessage: failure.message,
            )),
        (movieDetails) => emit(state.copyWith(
              movieDetail: movieDetails,
              movieDetailsState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase
        .call(RecommendationParameters(id: event.id));
    result.fold(
        (failure) => emit(state.copyWith(
              recommendationState: RequestState.error,
              recommendationMessage: failure.message,
            )),
        (recommendations) => emit(state.copyWith(
              recommendation: recommendations,
              recommendationState: RequestState.loaded,
            )));
  }
}
