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
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchLine(),
                );
              },
            )
          ],
        ),
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
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: ImageCard(
                      photo: state.imageList[index],
                    ),
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

class SearchLine extends SearchDelegate {
  List<String> keywords = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in keywords) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    // должен возникнуть список подсказок?
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in keywords) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
