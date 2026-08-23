import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_news/core/error/failures.dart';
import 'package:simple_news/core/result/result.dart';
import 'package:simple_news/domain/entities/news.dart';
import 'package:simple_news/domain/repositories/news_repository.dart';
import 'package:simple_news/domain/usecases/get_news_usecase.dart';

import '../repositories/news_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NewsRepository>()])
void main() {
  late MockNewsRepository repository;
  final newsList = [
    News(
      title: "Test Title",
      description: "Test Description",
      url: "https://example.com/test-news",
      content: "Test Content",
      author: "Test Author",
      imageUrl: "https://example.com/test-image.jpg",
    ),
  ];
  setUp(() {
    provideDummy<Result<List<News>>>(Success(newsList));
    repository = MockNewsRepository();
  });
  test(
    "should return Success when news data is fetched successfully",
    () async {
      when(repository.getNews()).thenAnswer((_) async => Success(newsList));
      final usecase = GetNewsUsecase(repository);
      final result = await usecase();
      expect(result, isA<Success>());

      verify(repository.getNews()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
  test("should return valid news data when successful", () async {
    when(repository.getNews()).thenAnswer((_) async => Success(newsList));
    final usecase = GetNewsUsecase(repository);
    final result = await usecase();
    expect(result, isA<Success>());
    expect((result as Success).data, newsList);

    verify(repository.getNews()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test("should return failure when error occurs", () async {
    when(
      repository.getNews(),
    ).thenAnswer((_) async => Failure(NetworkFailure()));
    final usecase = GetNewsUsecase(repository);
    final result = await usecase();
    expect(result, isA<Failure>());

    verify(repository.getNews()).called(1);
    verifyNoMoreInteractions(repository);
  });
  test("should return failure when error occurs", () async {
    when(
      repository.getNews(),
    ).thenAnswer((_) async => Failure(NetworkFailure()));
    final usecase = GetNewsUsecase(repository);
    final result = await usecase();
    expect(result, isA<Failure>());

    verify(repository.getNews()).called(1);
    verifyNoMoreInteractions(repository);
  });
  test("should return network failure when network error occurs", () async {
    when(
      repository.getNews(),
    ).thenAnswer((_) async => Failure(NetworkFailure()));
    final usecase = GetNewsUsecase(repository);
    final result = await usecase();
    expect((result as Failure).failure, isA<NetworkFailure>());
    verify(repository.getNews()).called(1);
    verifyNoMoreInteractions(repository);
  });
  test("should return server failure when server error occurs", () async {
    when(
      repository.getNews(),
    ).thenAnswer((_) async => Failure(ServerFailure()));
    final usecase = GetNewsUsecase(repository);
    final result = await usecase();
    expect((result as Failure).failure, isA<ServerFailure>());
    verify(repository.getNews()).called(1);
    verifyNoMoreInteractions(repository);
  });
  test("should return unknown failure when unknown error occurs", () async {
    when(
      repository.getNews(),
    ).thenAnswer((_) async => Failure(UnknownFailure()));
    final usecase = GetNewsUsecase(repository);
    final result = await usecase();
    expect((result as Failure).failure, isA<UnknownFailure>());
    verify(repository.getNews()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
