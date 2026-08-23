import 'package:dio/dio.dart';
import 'package:simple_news/core/error/exception_mapper.dart';
import 'package:simple_news/core/error/failures.dart';
import 'package:simple_news/core/result/result.dart';
import 'package:simple_news/data/data_sources/remote/news_remote_data_source.dart';
import 'package:simple_news/data/mappers/news_mapper.dart';
import 'package:simple_news/domain/entities/news.dart';
import 'package:simple_news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<List<News>>> getNews() async {
    try {
      final news = await remoteDataSource.getNews();
      return Success(news.map((n) => n.toEntity()).toList());
    } on DioException catch (e) {
      return Failure(mapDioExceptionToFailure(e));
    } catch (e) {
      print("Unknown error: $e");
      return Failure(UnknownFailure());
    }
  }
}
