import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_news/core/result/result.dart';
import 'package:simple_news/di/news_di.dart';
import 'package:simple_news/domain/entities/news.dart';
part 'news_notifier.g.dart';

@riverpod
class NewsNotifier extends _$NewsNotifier {
  @override
  Future<List<News>> build() async {
    final getNews = ref.read(getNewsUsecase);
    final news = await getNews();
    return switch (news) {
      Success(:final data) => data,
      Failure(:final failure) => throw failure,
    };
  }
}
