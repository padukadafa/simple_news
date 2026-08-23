import 'package:simple_news/core/result/result.dart';
import 'package:simple_news/domain/entities/news.dart';
import 'package:simple_news/domain/repositories/news_repository.dart';

class GetNewsUsecase {
  final NewsRepository repository;

  GetNewsUsecase(this.repository);

  Future<Result<List<News>>> call() {
    return repository.getNews();
  }
}
