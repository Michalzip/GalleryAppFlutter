part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  List<Object> get props => [];
}

class GetGallery extends GalleryEvent {}
