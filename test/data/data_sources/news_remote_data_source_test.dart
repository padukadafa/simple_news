import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_news/core/network/api_client.dart';
import 'package:simple_news/data/data_sources/remote/news_remote_data_source.dart';
import 'package:simple_news/data/models/news_model.dart';

import 'news_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ApiClient>()])
void main() {
  late NewsRemoteDataSource newsRemoteDataSource;
  late MockApiClient mockApiClient;
  final articlesResponse = {
    "status": "ok",
    "totalResults": 1,
    "articles": [
      {
        "source": {"id": null, "name": "Example.com"},
        "author": "John Doe",
        "title": "Test News Title",
        "description": "Test News Description",
        "url": "https://example.com/test-news",
        "urlToImage": "https://example.com/test-image.jpg",
        "publishedAt": "2023-01-01T00:00:00Z",
        "content": "Test News Content",
      },
    ],
  };
  final articles = [
    NewsModel(
      title: "Test News Title",
      description: "Test News Description",
      url: "https://example.com/test-news",
      content: "Test News Content",
      author: "John Doe",
      urlToImage: "https://example.com/test-image.jpg",
      publishedAt: "2023-01-01T00:00:00Z",
    ),
  ];
  setUp(() {
    mockApiClient = MockApiClient();
    newsRemoteDataSource = NewsRemoteDataSourceImpl(mockApiClient);
  });
  setUpAll(() async {
    await dotenv.load(); // Load environment variables before running tests
  });

  group("getNews", () {
    test(
      "should return list of NewsModel when response is successful",
      () async {
        when(
          mockApiClient.get<Map<String, dynamic>>(any),
        ).thenAnswer((_) async => articlesResponse);
        final result = await newsRemoteDataSource.getNews();
        expect(result, articles);
        verify(mockApiClient.get<Map<String, dynamic>>(any)).called(1);
      },
    );

    test("should throw an exception when response is unsuccessful", () async {
      when(mockApiClient.get<Map<String, dynamic>>(any)).thenThrow(Exception());
      expect(() => newsRemoteDataSource.getNews(), throwsException);
      verify(mockApiClient.get<Map<String, dynamic>>(any)).called(1);
    });

    test("should return empty list when articles is null", () async {
      when(mockApiClient.get<Map<String, dynamic>>(any)).thenAnswer(
        (_) async => {"status": "ok", "totalResults": 0, "articles": null},
      );
      final result = await newsRemoteDataSource.getNews();
      expect(result, []);
      verify(mockApiClient.get<Map<String, dynamic>>(any)).called(1);
    });
  });
}
