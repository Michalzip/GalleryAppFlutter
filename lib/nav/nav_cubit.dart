import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/model/gallery.dart';
import 'package:bloc/bloc.dart';

late GalleryModel empty;

class NavCubit extends Cubit<GalleryModel> {
  NavCubit() : super(empty);

  void showPostDetails(GalleryModel gallery) => emit(gallery);

  void popToPosts() => emit(empty);
}
