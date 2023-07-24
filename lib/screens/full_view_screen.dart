import 'package:flickr_viewer/models/image_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flickr_viewer/bloc/favs/favs_bloc.dart';

class FullViewScreen extends StatelessWidget {
  const FullViewScreen({Key? key, required this.image}) : super(key: key);

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    // final FavsBloc favsBloc = BlocProvider.of<FavsBloc>(context);

    // return BlocBuilder<FavsBloc, FavsState>(
      // bloc: favsBloc,
      // state: fav
      // builder: (BuildContext context, state) {
        // state.favImages;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                // image:
                image: NetworkImage(image.fullUrl),
                fit: BoxFit.contain,
                // fit: BoxFit.cover,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            // child: (state.favImages && state.fa),
            child: const Icon(Icons.favorite_border_outlined),
            onPressed: () {
              favsBloc.addFavImage(image);
              // context.read<FavsBloc>().add(FavAdded(favImage: image));
            },
        ),
          // ) : FloatingActionButton(
          //   child: (state is FavsLoadSuccess)
          //       ? const Icon(Icons.favorite)
          //       : const Icon(Icons.favorite_border_outlined),
          //   onPressed: () {
          //     // favsBloc.deleteFavImage();
          //     // context.read<FavsBloc>().add(FavRemoved(favImage: image));
          //   },
          // ),
        );
      }
    // );
  // }
}
