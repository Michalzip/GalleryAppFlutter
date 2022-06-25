import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

class GalleryModel {
  GalleryModel({this.title, this.url, this.thumbnailUrl});

  final String? title;
  final String? url;
  final String? thumbnailUrl;

  GalleryModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];

  // List<Object> get props => [title ?? null, url, thumbnailUrl];
}
