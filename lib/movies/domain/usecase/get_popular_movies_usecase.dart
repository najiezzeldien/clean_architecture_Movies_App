import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCase
    extends BaseUseCase<List<Movie>, GetPopularMoviesParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(
      GetPopularMoviesParameters noParameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}

class GetPopularMoviesParameters extends Equatable {
  const GetPopularMoviesParameters();
  @override
  List<Object?> get props => [];
}
