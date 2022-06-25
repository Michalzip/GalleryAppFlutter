import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/nav/nav_cubit.dart';
import 'package:gallery_app/model/gallery.dart';
import 'package:gallery_app/view/gallery_page.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //- handles building widgets in respoinse to new state
    return BlocBuilder<NavCubit, GalleryModel>(
      builder: ((context, state) {
        return Navigator(
          pages: [
            MaterialPage(child: GalleryView()),
            if (state.title != null)
              MaterialPage(
                  child: PhotoPage(
                photo: state,
              ))
          ],
          onPopPage: (route, result) {
            // BlocProvider.of<NavCubit>(context).popToPosts();
            return route.didPop(result);
          },
        );
      }),
    );
  }
}
