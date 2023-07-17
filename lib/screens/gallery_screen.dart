import 'package:flickr_viewer/block/bloc/f_viewer_bloc.dart';
import 'package:flickr_viewer/widgets/columns_count_slider.dart';
import 'package:flickr_viewer/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final galleryBloc = BlocProvider.of<FViewerBloc>(context);

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
              galleryBloc.add(ShowSettingsEvent());
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
        ],
        bottom: (isShowMenu == true)
            ? PreferredSize(
                preferredSize: const Size.fromHeight(48.0),
                child: Container(
                  height: 48.0,
                  alignment: Alignment.center,
                  child: const ColumnsCountSlider(),
                ),
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
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final galleryBloc = BlocProvider.of<FViewerBloc>(context);

    return TextField(
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search',
        filled: true,
        prefixIcon: Icon(Icons.search),
        border: InputBorder.none,
      ),
      onSubmitted: (value) {
        galleryBloc.add(SearchImagesEvent(value));
      },
    );
  }
}
