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

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Search',
        filled: true,
        prefixIcon: Icon(Icons.search),
        border: InputBorder.none,
      ),
      onSubmitted: (value) {
        context.read<FViewerBloc>().add(SearchImagesEvent(value));
      },
    );
  }
}

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final images = context.select((FViewerBloc bloc) => bloc.state.images);
    final isShowMenu =
        context.select((FViewerBloc bloc) => bloc.state.isShowSettings);
    final columnsCount =
        context.select((FViewerBloc bloc) => bloc.state.columnsCount);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: SearchTextField(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // context.s
              context.read<FViewerBloc>().add(ShowSettingsEvent());
            },
            icon: const Icon(Icons.settings_input_component_outlined),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/favorites',
                );
              },
              icon: const Icon(Icons.bookmarks_outlined)),
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {
          //     // _bloc.add() заменить setState на обращения к блок
          //     // setState(() {
          //     // context.read<FViewerBloc>().add()
          //     _isSearch = true;

          //     // });
          //   },
          // )
        ],
        // flexibleSpace: Container(child: Text(')))))0')),
        bottom: (isShowMenu == true)
            ? PreferredSize(
                preferredSize: const Size.fromHeight(48.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        context.read<FViewerBloc>().add(SetColunmsEvent(1));
                      },
                      child: const Text('One column'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<FViewerBloc>().add(SetColunmsEvent(2));
                      },
                      child: const Text('Two columns'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<FViewerBloc>().add(SetColunmsEvent(4));
                      },
                      child: const Text('Four column'),
                    )
                  ],
                )
                // child: Container(
                //   height: 48.0,
                //   alignment: Alignment.center,
                //   // child: const Text('controller'),
                //   child: const ColumnsCountSlider(),
                // ),
                )
            : null,
      ),
      body: (images.isNotEmpty)
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columnsCount.toInt(),
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: ImageCard(
                    photo: images[index],
                  ),
                );
              },
            )
          : const Center(child: Text('')),

      // if (state is FViewerDataLoadedFailure) {
      //   return const Center(
      //     child: Text('Something went wrong...'),
      //   );
      // }

      // return const Center(
      //   child: CircularProgressIndicator(),
      // );
    );
  }
}
