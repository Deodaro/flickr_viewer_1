import 'package:flickr_viewer/block/bloc/f_viewer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flickr_viewer/router/router.dart';
import 'package:flickr_viewer/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlickrViewerApp extends StatelessWidget {
  const FlickrViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FViewerBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flickr Viewer',
        theme: darkTheme,
        routes: routes,
      ),
    );
  }
}
