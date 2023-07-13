import 'package:flutter/material.dart';
import 'package:flickr_viewer/router/router.dart';
import 'package:flickr_viewer/theme/theme.dart';

class FlickrViewerApp extends StatelessWidget {
  const FlickrViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flickr Viewer',
      theme: darkTheme,
      routes: routes,
    );
  }
}
