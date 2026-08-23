import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_news/core/error/failures.dart';
import 'package:simple_news/presentation/providers/news_notifier.dart';
import 'package:simple_news/presentation/widgets/news_item_widget.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: Consumer(
        builder: (context, ref, child) {
          final news = ref.watch(newsProvider);
          return news.when(
            data: (newsList) {
              return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final newsItem = newsList[index];
                  return NewsItemWidget(newsItem: newsItem);
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) {
              if (error is NetworkFailure) {
                return Center(child: Text('Network error occured '));
              } else if (error is ServerFailure) {
                return Center(child: Text('Server error occured'));
              } else {
                return const Center(
                  child: Text('An unexpected error occurred.'),
                );
              }
            },
          );
        },
      ),
    );
  }
}
