import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_news/core/router/app_routes.dart';
import 'package:simple_news/domain/entities/news.dart';
import 'package:simple_news/presentation/pages/news_detail_page.dart';
import 'package:simple_news/presentation/pages/news_list_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.newsList,
    routes: [
      standartRoute(name: AppRoutes.newsList, screen: const NewsListPage()),
      standartRoute(
        name: AppRoutes.newsDetail,
        builder: (context, state) {
          final news = state.extra as News;
          return NewsDetailPage(news: news);
        },
      ),
    ],
  );

  static GoRoute standartRoute({
    required String name,
    String? path,
    Widget? screen,
    Widget Function(BuildContext, GoRouterState)? builder,
    PageTransitionType transitionType = PageTransitionType.theme,
  }) {
    if (screen == null) {
      return GoRoute(
        path: path ?? name,
        name: name,
        builder: builder ?? (context, state) => Placeholder(),
      );
    }
    return GoRoute(
      path: name,
      name: name,
      builder: builder ?? (context, state) => screen,
    );
  }
}
