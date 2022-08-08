import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetPlayNowMoviesUseCase
    extends BaseUseCase<List<Movie>, GetPlayNowMoviesParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPlayNowMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(
      GetPlayNowMoviesParameters noParameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}

class GetPlayNowMoviesParameters extends Equatable {
  const GetPlayNowMoviesParameters();
  @override
  List<Object?> get props => [];
}
