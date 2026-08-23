import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_news/core/error/failures.dart';
import 'package:simple_news/core/result/result.dart';
import 'package:simple_news/data/data_sources/remote/news_remote_data_source.dart';
import 'package:simple_news/data/mappers/news_mapper.dart';
import 'package:simple_news/data/models/news_model.dart';
import 'package:simple_news/data/repositories/news_repository_impl.dart';
import 'package:simple_news/domain/entities/news.dart';

import 'news_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NewsRemoteDataSource>()])
void main() {
  late MockNewsRemoteDataSource mockRemoteDataSource;
  late NewsRepositoryImpl repository;
  final newsList = [
    NewsModel(
      title: "Test Title",
      description: "Test Description",
      url: "https://example.com/test-news",
      content: "Test Content",
      author: "Test Author",
      urlToImage: "https://example.com/test-image.jpg",
      publishedAt: "2023-01-01T00:00:00Z",
    ),
  ];
  setUp(() {
    mockRemoteDataSource = MockNewsRemoteDataSource();
    repository = NewsRepositoryImpl(mockRemoteDataSource);
  });

  group("Get News", () {
    test("should return success when data is available", () async {
      when(mockRemoteDataSource.getNews()).thenAnswer((_) async => newsList);
      final result = await repository.getNews();
      expect(result, isA<Success>());
      verify(mockRemoteDataSource.getNews()).called(1);
    });

    test("Should return News Entity when data is available", () async {
      when(mockRemoteDataSource.getNews()).thenAnswer((_) async => newsList);
      final result = await repository.getNews();
      expect((result as Success).data, isA<List<News>>());
      verify(mockRemoteDataSource.getNews()).called(1);
    });

    test("should return News data when data is available", () async {
      when(mockRemoteDataSource.getNews()).thenAnswer((_) async => newsList);
      final result = await repository.getNews();
      expect(
        (result as Success).data,
        newsList.map((n) => n.toEntity()).toList(),
      );
      verify(mockRemoteDataSource.getNews()).called(1);
    });

    test("should return failure when error occurs", () async {
      when(mockRemoteDataSource.getNews()).thenThrow(Exception());
      final result = await repository.getNews();
      expect(result, isA<Failure>());
      verify(mockRemoteDataSource.getNews()).called(1);
    });

    test(
      "Should return UnknownFailure when unhandled exception occurs",
      () async {
        when(mockRemoteDataSource.getNews()).thenThrow(Exception());
        final result = await repository.getNews();
        expect(result, isA<Failure>());
        expect((result as Failure).failure, isA<UnknownFailure>());
        verify(mockRemoteDataSource.getNews()).called(1);
      },
    );
    test(
      "Should return UnknownFailure when unhandled DioException occurs",
      () async {
        when(mockRemoteDataSource.getNews()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 432,
            ),
          ),
        );
        final result = await repository.getNews();
        expect(result, isA<Failure>());
        expect((result as Failure).failure, isA<UnknownFailure>());
        verify(mockRemoteDataSource.getNews()).called(1);
      },
    );

    test(
      "Should return NetworkFailure when DioException with type connectionTimeout occurs",
      () async {
        when(mockRemoteDataSource.getNews()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 0,
            ),
            type: DioExceptionType.connectionTimeout,
          ),
        );
        final result = await repository.getNews();
        expect(result, isA<Failure>());
        expect((result as Failure).failure, isA<NetworkFailure>());
        verify(mockRemoteDataSource.getNews()).called(1);
      },
    );

    test(
      "Should return NetworkFailure when DioException with type receiveTimeout occurs",
      () async {
        when(mockRemoteDataSource.getNews()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 0,
            ),
            type: DioExceptionType.receiveTimeout,
          ),
        );
        final result = await repository.getNews();
        expect(result, isA<Failure>());
        expect((result as Failure).failure, isA<NetworkFailure>());
        verify(mockRemoteDataSource.getNews()).called(1);
      },
    );

    test(
      "Should return NetworkFailure when DioException with type sendTimeout occurs",
      () async {
        when(mockRemoteDataSource.getNews()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 0,
            ),
            type: DioExceptionType.sendTimeout,
          ),
        );
        final result = await repository.getNews();
        expect(result, isA<Failure>());
        expect((result as Failure).failure, isA<NetworkFailure>());
        verify(mockRemoteDataSource.getNews()).called(1);
      },
    );
    test(
      "Should return NetworkFailure when DioException with type connectionError occurs",
      () async {
        when(mockRemoteDataSource.getNews()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 0,
            ),
            type: DioExceptionType.connectionError,
          ),
        );
        final result = await repository.getNews();
        expect(result, isA<Failure>());
        expect((result as Failure).failure, isA<NetworkFailure>());
        verify(mockRemoteDataSource.getNews()).called(1);
      },
    );

    test(
      "Should return ServerFailure when DioException with type badResponse occurs",
      () async {
        when(mockRemoteDataSource.getNews()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 500,
            ),
            type: DioExceptionType.badResponse,
          ),
        );
        final result = await repository.getNews();
        expect(result, isA<Failure>());
        expect((result as Failure).failure, isA<ServerFailure>());
        verify(mockRemoteDataSource.getNews()).called(1);
      },
    );
  });
}
