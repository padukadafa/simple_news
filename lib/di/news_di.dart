import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_news/core/di/network_di.dart';
import 'package:simple_news/data/data_sources/remote/news_remote_data_source.dart';
import 'package:simple_news/data/repositories/news_repository_impl.dart';
import 'package:simple_news/domain/repositories/news_repository.dart';
import 'package:simple_news/domain/usecases/get_news_usecase.dart';

final newsRemoteDataSourceProvider = Provider<NewsRemoteDataSource>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return NewsRemoteDataSourceImpl(apiClient);
});
final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final remoteDataSource = ref.watch(newsRemoteDataSourceProvider);
  return NewsRepositoryImpl(remoteDataSource);
});

final getNewsUsecase = Provider<GetNewsUsecase>((ref) {
  final newsRepository = ref.watch(newsRepositoryProvider);
  return GetNewsUsecase(newsRepository);
});
