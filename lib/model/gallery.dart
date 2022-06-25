import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

class GalleryModel extends Equatable {
  GalleryModel(
      {required this.title, required this.url, required this.thumbnailUrl});

  final String title;
  final String url;
  final String thumbnailUrl;

  GalleryModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];

  List<Object> get props => [title, url, thumbnailUrl];
}

class Post {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Post({this.userId, this.id, this.title, this.body});
}
