import 'package:cached_network_image/cached_network_image.dart';
import 'package:flickr_viewer/repositories/models/photo.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.photo,
  });

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => const CircularProgressIndicator(),
      imageUrl: 'http://via.placeholder.com/350x150',
    );
    // return Image.network(
    //   photo.url,
    //   width: 100.0,
    //   height: 100.0,
    // );
    // final theme = Theme.of(context);
    // return Image.network(
    // 'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg');
    // onTap: () {
    //   Navigator.of(context).pushNamed(
    //     '/info',
    //     arguments: photo,
    //   );
    // },
  }
}
