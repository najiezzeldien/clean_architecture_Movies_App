import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetTopRatedMoviesUseCase
    extends BaseUseCase<List<Movie>, GetTopRatedMoviesParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(
      GetTopRatedMoviesParameters noParameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}

class GetTopRatedMoviesParameters extends Equatable {
  const GetTopRatedMoviesParameters();
  @override
  List<Object?> get props => [];
}