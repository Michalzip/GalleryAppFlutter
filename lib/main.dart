import 'package:flutter/material.dart';
import 'package:gallery_app/bloc_observer.dart';
import 'package:gallery_app/nav/navigator.dart';
import 'package:gallery_app/nav/nav_cubit.dart';
import 'package:gallery_app/bloc/gallery_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  BlocOverrides.runZoned(() {
    runApp(MyApp());
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GalleryBloc>(
          create: (context) => GalleryBloc()..add(GetGallery()),
        ),
        BlocProvider<NavCubit>(
          create: (context) => NavCubit(),
        ),
      ],
      child: const NavigatorPage(),
    );
  }
}
