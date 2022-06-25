import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/model/gallery.dart';
import 'package:bloc/bloc.dart';

class NavCubit extends Cubit<GalleryModel> {
  NavCubit() : super(GalleryModel(title: null));

  void showPostDetails(GalleryModel gallery) => emit(gallery);

  void popToPosts() => emit(GalleryModel(title: null));
}
