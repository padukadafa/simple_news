import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String title;
  final String description;
  final String? author;
  final String? imageUrl;
  final String? url;
  final String content;

  const News({
    required this.title,
    required this.description,
    required this.author,
    required this.imageUrl,
    required this.url,
    required this.content,
  });

  @override
  List<Object?> get props => [
    title,
    description,
    author,
    imageUrl,
    url,
    content,
  ];
}
