// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
  title: json['title'] as String?,
  description: json['description'] as String?,
  author: json['author'] as String?,
  urlToImage: json['urlToImage'] as String?,
  url: json['url'] as String?,
  content: json['content'] as String?,
  publishedAt: json['publishedAt'] as String?,
);

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'author': instance.author,
  'urlToImage': instance.urlToImage,
  'url': instance.url,
  'publishedAt': instance.publishedAt,
  'content': instance.content,
};
