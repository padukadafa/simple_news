import 'package:flutter_test/flutter_test.dart';
import 'package:simple_news/data/mappers/news_mapper.dart';
import 'package:simple_news/data/models/news_model.dart';
import 'package:simple_news/domain/entities/news.dart';

void main() {
  final news = News(
    title: "Test Title",
    description: "Test Description",
    url: "https://example.com/test-news",
    content: "Test Content",
    author: "Test Author",
    imageUrl: "https://example.com/test-image.jpg",
  );
  final newsMap = {
    "title": "Test Title",
    "description": "Test Description",
    "url": "https://example.com/test-news",
    "content": "Test Content",
    "urlToImage": "https://example.com/test-image.jpg",
    "publishedAt": "2023-01-01T00:00:00Z",
    "author": "Test Author",
    "source": {"id": null, "name": "Example.com"},
  };

  test("Should retur a valid model when fromJson is called", () {
    final result = NewsModel.fromJson(newsMap);
    expect(result, isA<NewsModel>());
  });

  test("Should return a valid News entity when toEntity is called", () {
    final model = NewsModel.fromJson(newsMap);
    final result = model.toEntity();
    expect(result, news);
  });
  test("Should handle null values in fromJson", () {
    final newsMapWithNulls = {
      "title": "Test Title",
      "description": "Test Description",
      "url": null,
      "content": "Test Content",
      "urlToImage": null,
      "publishedAt": "2023-01-01T00:00:00Z",
      "author": null,
      "source": {"id": null, "name": "Example.com"},
    };
    final result = NewsModel.fromJson(newsMapWithNulls);
    expect(result.url, isNull);
    expect(result.urlToImage, isNull);
    expect(result.author, isNull);
  });
}
