import 'package:flickr_viewer/favs/bloc/favs_bloc.dart';
import 'package:flickr_viewer/models/image_model.dart';
import 'package:flickr_viewer/repositories/favs_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class FullViewScreen extends StatelessWidget {
  const FullViewScreen({Key? key, required this.image}) : super(key: key);

  // final favButtonController = ();

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavsBloc(RepositoryProvider.of<FavsRepository>(context)),
      child: BlocBuilder<FavsBloc, FavsState>(
        builder: (context, state) {
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
            floatingActionButton: IconButton.outlined(
              icon: const Icon(Icons.favorite_border_outlined),
              selectedIcon: const Icon(Icons.g_mobiledata),
              isSelected: image.isFav == true ? true : false,
              onPressed: () {
                if (image.isFav == false) {
                  BlocProvider.of<FavsBloc>(context).add(FavAdded(image));
                  // context.read<FavsBloc>().add(FavAdded(image));
                } else {
                  BlocProvider.of<FavsBloc>(context).add(FavRemoved(image.id));
                  // context.read<FavsBloc>().add(FavRemoved(image.id));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
