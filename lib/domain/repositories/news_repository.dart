import 'package:simple_news/core/result/result.dart';
import 'package:simple_news/domain/entities/news.dart';

abstract class NewsRepository {
  Future<Result<List<News>>> getNews();
}
