import 'package:flickr_viewer/repositories/models/photo.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
    super.key,
    required this.photo,
  });

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      title: Text(
        photo.title,
        style: theme.textTheme.bodyMedium,
      ),
      // onTap: () {
      //   Navigator.of(context).pushNamed(
      //     '/info',
      //     arguments: photo,
      //   );
      // },
    );
  }
}
