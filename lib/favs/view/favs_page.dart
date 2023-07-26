import 'package:flickr_viewer/favs/bloc/favs_bloc.dart';
import 'package:flickr_viewer/repositories/favs_repository.dart';
import 'package:flickr_viewer/widgets/images_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavsPage extends StatelessWidget {
  const FavsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocProvider(
        create: (context) =>
            FavsBloc(RepositoryProvider.of<FavsRepository>(context)),
        child: BlocBuilder<FavsBloc, FavsState>(
          builder: (context, state) {
            if (state is AllFavsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AllFavsLoadSuccess) {
              return ImagesGrid(imageList: state.favImages);
            }

            return Container();
          },
        ),
      ),
    );
  }
}
