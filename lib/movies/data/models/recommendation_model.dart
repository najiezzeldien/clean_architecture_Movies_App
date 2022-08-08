import 'package:movies_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });
  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath:
            json["backdrop_path"] ?? '/p1F51Lvj3sMopG948F5HsBbl43C.jpg',
        id: json["id"],
      );
}
