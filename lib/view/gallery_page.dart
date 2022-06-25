import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/bloc/gallery_bloc.dart';
import 'package:gallery_app/model/gallery.dart';
import 'package:gallery_app/nav/nav_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';

// class GalleryPage extends StatelessWidget {
//   const GalleryPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (_) => GalleryBloc()..add(GetGallery()), child: GalleryView());
//   }
// }

class GalleryView extends StatelessWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
      switch (state.status) {
        case PhotoCondition.initial:
          return Center(child: Text('initial'));

        //return Center(child: Text('initial'));

        case PhotoCondition.success:
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 1.0),
              itemCount: state.photos.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  GestureDetector(
                      child: CachedNetworkImage(
                        imageUrl: state.photos[index].thumbnailUrl!,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Container(
                            child: Column(
                          children: [
                            Icon(Icons.error, color: Colors.red),
                            Text('something went wrong')
                          ],
                        )),
                      ),
                      onTap: () {
                        BlocProvider.of<NavCubit>(context)
                            .showPostDetails(state.photos[index]);
                      }),
                ]);
              });
        case PhotoCondition.error:
          return Center(child: Text('erorr'));
      }
    });
  }
}

class PhotoPage extends StatelessWidget {
  const PhotoPage({Key? key, required this.photo}) : super(key: key);
  final GalleryModel photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          shadowColor: Colors.white10,
          title: Text(photo.title!),
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(photo.url!),
                ),
              ),
            )
          ],
        ));
  }
}
