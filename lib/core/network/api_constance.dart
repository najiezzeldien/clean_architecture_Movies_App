class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "632dbba63019820a469535ef9a990f58";
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
  static String movieDeatilsPath(int movieId) {
    return "$baseUrl/movie/$movieId?api_key=$apiKey";
  }

  static String recommendationPath(int movieId) {
    return "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
  }

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) {
    return '$baseImageUrl$path';
  }
}
