// import 'package:flickr_viewer/widgets/image_card.dart';
// import 'package:flickr_viewer/block/bloc/f_viewer_bloc.dart';
import 'package:flickr_viewer/block/bloc/f_viewer_bloc.dart';
// import 'package:flickr_viewer/repositories/images_repository.dart';
// import 'package:flickr_viewer/repositories/models/photo.dart';
// import 'package:flickr_viewer/widgets/content_area.dart';
import 'package:flickr_viewer/widgets/image_card.dart';
// import 'package:flickr_viewer/widgets/search_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  // List<Photo> _imageList = <Photo>[];

  final _fViewerBloc = FViewerBloc();

  final _columnsNumber = 2;

  @override
  void initState() {
    // _loadData();
    _fViewerBloc.add(LoadData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Gallery'),
        ),
        // body: Column(
        //   children: [
        //     const SearchPanel(),
        //     Expanded(
        //       child: ContentArea(
        //         imageList: _imageList,
        //       ),
        //     ),
        //   ],
        // ),
        body: BlocBuilder<FViewerBloc, FViewerState>(
          bloc: _fViewerBloc,
          builder: (context, state) {
            if (state is FViewerDataLoaded) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _columnsNumber,
                ),
                itemCount: state.imageList.length,
                itemBuilder: (context, index) {
                  return ImageCard(
                    photo: state.imageList[index],
                  );
                },
              );
            }
            if (state is FViewerDataLoadedFailure) {
              return const Center(
                child: Text('Something went wrong...'),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
