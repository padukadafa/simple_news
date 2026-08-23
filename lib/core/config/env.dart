import 'package:flutter_dotenv/flutter_dotenv.dart';

final class Env {
  Env._();
  // using api key from .env file is not recommended for production apps, consider using backend server to hide the api key
  static String get apiKey => dotenv.env['NEWS_API_KEY'] ?? '';
  static String get apiBaseUrl => dotenv.env['NEWS_API_BASE_URL'] ?? '';
  static String get imagePlaceholderUrl =>
      dotenv.env['IMAGE_PLACEHOLDER_URL'] ?? '';
}
