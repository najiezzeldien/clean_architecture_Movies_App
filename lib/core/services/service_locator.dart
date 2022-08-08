import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentaion/controller/movie_details_bloc.dart';
import 'package:movies_app/movies/presentaion/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Bloc
    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));
    sl.registerFactory(() => MovieDetailsBloc(
          sl(),
          sl(),
        ));
    // Use Cases
    sl.registerLazySingleton(
      () => GetPlayNowMoviesUseCase(
        sl(),
      ),
    );
    sl.registerLazySingleton(
      () => GetPopularMoviesUseCase(
        sl(),
      ),
    );
    sl.registerLazySingleton(
      () => GetTopRatedMoviesUseCase(
        sl(),
      ),
    );
    sl.registerLazySingleton(
      () => GetMovieDetailsUseCase(
        sl(),
      ),
    );
    sl.registerLazySingleton(
      () => GetRecommendationUseCase(
        sl(),
      ),
    );
    // Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(
        sl(),
      ),
    );
    // data sources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
