// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NewsNotifier)
final newsProvider = NewsNotifierProvider._();

final class NewsNotifierProvider
    extends $AsyncNotifierProvider<NewsNotifier, List<News>> {
  NewsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newsNotifierHash();

  @$internal
  @override
  NewsNotifier create() => NewsNotifier();
}

String _$newsNotifierHash() => r'608ec57fd2bcd9e6637d53ffca3a8c019a219c57';

abstract class _$NewsNotifier extends $AsyncNotifier<List<News>> {
  FutureOr<List<News>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<News>>, List<News>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<News>>, List<News>>,
              AsyncValue<List<News>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
