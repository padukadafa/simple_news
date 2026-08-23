import 'package:simple_news/data/models/news_model.dart';
import 'package:simple_news/domain/entities/news.dart';

extension NewsModelMapper on NewsModel {
  News toEntity() {
    return News(
      title: title ?? 'No Title',
      description: description ?? 'No Description',
      url: url,
      imageUrl: urlToImage,
      content: content ?? 'No Content',
      author: author,
    );
  }
}
