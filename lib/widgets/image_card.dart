import 'package:cached_network_image/cached_network_image.dart';
import 'package:flickr_viewer/repositories/models/photo.dart';
import 'package:flickr_viewer/screens/full_view_screen.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.photo,
  });

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          FullViewScreen.routeName,
          arguments: ScreenArguments(photo.url),
        );
      },
      child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: photo.url,
      ),
    );
  }
}
