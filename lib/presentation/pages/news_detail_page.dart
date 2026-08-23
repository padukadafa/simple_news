import 'package:flutter/material.dart';
import 'package:simple_news/domain/entities/news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key, required this.news});
  final News news;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late final WebViewController controller;
  int _progress = 0;

  @override
  initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            setState(() {
              _progress = progress;
            });
          },
          onPageStarted: (_) {
            setState(() {
              _progress = 0;
            });
          },
          onPageFinished: (_) {
            setState(() {
              _progress = 100;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.news.url ?? ""));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.news.title)),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          LinearProgressIndicator(value: _progress / 100),
        ],
      ),
    );
  }
}
