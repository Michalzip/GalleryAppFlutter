import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery_app/model/gallery.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'gallery_state.dart';
part 'gallery_event.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(GalleryState()) {
    on<GetGallery>(_onDisplayGallery);
  }

  Future<void> _onDisplayGallery(
      GalleryEvent event, Emitter<GalleryState> emit) async {
    if (state.status == PhotoCondition.initial) {
      final photos = await _onFetchedGallery();
      return emit(state.copyWith(
        status: PhotoCondition.success,
        photos: photos,
      ));
    }
  }

  Future<List<GalleryModel>> _onFetchedGallery() async {
    print('here is_onFetchedApi ');
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      if (response.statusCode == 200) {
        final galleryMap = json.decode(response.body) as List;
        return galleryMap.map((dynamic json) {
          return GalleryModel(
            title: json['title'] as String,
            url: json['url'] as String,
            thumbnailUrl: json['thumbnailUrl'] as String,
          );
        }).toList();
      }
    } catch (e) {
      print(e);
      //prevent Throw Exception for too long time api waiting.
    }
    throw Exception("Fetching Error");
  }
}
