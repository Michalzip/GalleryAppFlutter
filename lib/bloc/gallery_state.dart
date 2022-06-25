part of 'gallery_bloc.dart';

enum PhotoCondition {
  initial,
  success,
  error,
}

class GalleryState extends Equatable {
  GalleryState({
    this.status = PhotoCondition.initial,
    this.photos = const <GalleryModel>[],
  });

  final PhotoCondition status;

//  final GalleryModel photoo ;

  GalleryState copyWith({PhotoCondition? status, List<GalleryModel>? photos}) {
    return GalleryState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
    );
  }

  final List<GalleryModel> photos;
  //final GalleryModel statue;

  List<Object> get props => [status, photos];
}
