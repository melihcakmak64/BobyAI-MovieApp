import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get baseUrl => dotenv.env['TMDB_BASE_URL']!;
  static String get bearerToken => dotenv.env['TMDB_BEARER_TOKEN']!;
  static String get imageBaseUrl => dotenv.env['TMDB_IMAGE_URL']!;

  //Movie Endpoints
  static String popularMovies({int page = 1}) => "/movie/popular?page=$page";
}
