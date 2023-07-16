// import 'package:flickr_viewer/widgets/image_card.dart';
import 'package:flickr_viewer/block/bloc/f_viewer_bloc.dart';
import 'package:flickr_viewer/repositories/flickr_viewer_repository.dart';
import 'package:flickr_viewer/repositories/models/photo.dart';
import 'package:flickr_viewer/widgets/content_area.dart';
import 'package:flickr_viewer/widgets/search_panel.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<Photo> _imageList = <Photo>[];

  final _fViewerBlock = FViewerBloc();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Gallery'),
      ),
      body: Column(
        children: [
          const SearchPanel(),
          Expanded(
            child: ContentArea(
              imageList: _imageList,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadData() async {
    _imageList = await FlickrViewerRepository().getImages();
    debugPrint(_imageList[0].toString());
    setState(() {});
  }
}
