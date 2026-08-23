import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_news/core/config/env.dart';
import 'package:simple_news/domain/entities/news.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({super.key, required this.newsItem});

  final News newsItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.pushNamed('/news_detail', extra: newsItem);
      },
      leading: CachedNetworkImage(
        imageUrl: newsItem.imageUrl ?? Env.imagePlaceholderUrl,
        fit: BoxFit.cover,
        width: 100,
        errorWidget: (context, url, error) =>
            const Icon(Icons.image_not_supported, size: 50),
      ),
      title: Text(newsItem.title, maxLines: 2, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        newsItem.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
