import 'package:movies_app/movies/data/models/genres.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json["backdrop_path"],
      genres: List<GenresModel>.from(
        json["genres"].map(
          (genre) => GenresModel.fromJson(genre),
        ),
      ),
      id: json["id"],
      overview: json["overview"],
      releaseDate: json["release_date"],
      runtime: json["runtime"],
      title: json["title"],
      voteAverage: json["vote_average"].toDouble(),
    );
  }
}
