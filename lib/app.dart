import 'package:flickr_viewer/favs/bloc/favs_bloc.dart';
import 'package:flickr_viewer/gallery/bloc/gallery_bloc.dart';
import 'package:flickr_viewer/repositories/favs_repository.dart';
import 'package:flickr_viewer/repositories/gallery_repository.dart';
import 'package:flickr_viewer/gallery/view/gallery_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flickr_viewer/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GalleryRepository>(
            create: (context) => GalleryRepository()),
        RepositoryProvider<FavsRepository>(
            create: (context) => FavsRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GalleryBloc>(
            create: (context) => GalleryBloc(
              context.read<GalleryRepository>(),
              context.read<FavsRepository>(),
            ),
          ),
          BlocProvider<FavsBloc>(
            create: (context) => FavsBloc(
              context.read<FavsRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flickr Viewer',
          theme: darkTheme,
          home: GalleryPage(),
        ),
      ),
    );
  }
}
