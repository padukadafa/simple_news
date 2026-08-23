import 'package:simple_news/core/config/env.dart';
import 'package:simple_news/core/network/api_client.dart';
import 'package:simple_news/data/models/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews();
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  final ApiClient apiClient;
  NewsRemoteDataSourceImpl(this.apiClient);
  @override
  Future<List<NewsModel>> getNews() async {
    String path = '${Env.apiBaseUrl}/top-headlines?country=us';
    final response = await apiClient.get<Map<String, dynamic>>(path);
    if (response['articles'] == null) {
      return [];
    }
    return (response['articles'] as List<dynamic>)
        .map((article) => NewsModel.fromJson(article))
        .toList();
  }
}
