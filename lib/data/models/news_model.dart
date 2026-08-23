import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends Equatable {
  final String? title;
  final String? description;
  final String? author;
  final String? urlToImage;
  final String? url;
  final String? publishedAt;
  final String? content;

  const NewsModel({
    this.title,
    this.description,
    this.author,
    this.urlToImage,
    this.url,
    this.content,
    this.publishedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  @override
  List<Object?> get props => [
    title,
    description,
    author,
    urlToImage,
    url,
    content,
    publishedAt,
  ];
}
