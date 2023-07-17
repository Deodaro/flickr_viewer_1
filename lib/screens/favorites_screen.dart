import 'package:flickr_viewer/block/bloc/f_viewer_bloc.dart';
import 'package:flickr_viewer/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final images = context.select((FViewerBloc bloc) => bloc.state.images);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text('Favorites'),
        ),
      ),
      body: (images.isNotEmpty)
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
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
          : const Center(child: Text('+')),
    );
  }
}
