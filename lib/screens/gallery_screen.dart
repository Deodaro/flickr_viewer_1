import 'package:flickr_viewer/repositories/flickr_viewer_repository.dart';
import 'package:flickr_viewer/repositories/models/photo.dart';
import 'package:flickr_viewer/widgets/image_card.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  // final String title;

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<Photo>? _photoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Gallery'),
      ),
      body: (_photoList == null)
          ? const SizedBox()
          : ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _photoList!.length,
              itemBuilder: (context, i) {
                final photo = _photoList![i];
                // final title = photo.title;

                return ImageCard(photo: photo);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          debugPrint('pressed');
          _photoList = await FlickrViewerRepository().getImages();
          setState(() {});
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
