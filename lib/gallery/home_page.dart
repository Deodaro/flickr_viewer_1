import 'package:flickr_viewer/favs/bloc/favs_bloc.dart';
import 'package:flickr_viewer/favs/favs_page.dart';
import 'package:flickr_viewer/gallery/bloc/gallery_bloc.dart';
import 'package:flickr_viewer/repositories/favs_repository.dart';
import 'package:flickr_viewer/repositories/gallery_repository.dart';

// import 'package:flickr_viewer/widgets/grid_control.dart';
import 'package:flickr_viewer/widgets/images_grid.dart';
import 'package:flickr_viewer/widgets/search_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryBloc(
        // TODO объединить репы?
        RepositoryProvider.of<GalleryRepository>(context),
        RepositoryProvider.of<FavsRepository>(context),
      )..add(RegisterServicesEvent()),
      // child: BlocBuilder<GalleryBloc, GalleryState>(
      // builder: (context, state) {
      // BlocProvider.of<FavsBloc>(context).add(RegistrationEvent());
      // return Scaffold(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gallery'),
          actions: <Widget>[
            // GridControl(),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  // MaterialPageRoute<FavsPage>(
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider.value(
                        value: BlocProvider.of<FavsBloc>(context),
                        child: FavsPage(),
                      );
                    },
                  ),
                );
              },
              icon: const Icon(Icons.bookmarks_outlined),
            ),
          ],
        ),
        // body: BlocBuilder<GalleryBloc, GalleryState>(
        body: Column(
          children: [
            const SearchPanel(),
            // ImagesGrid(),
            // BlocProvider(
            //   create: (BuildContext context) => GalleryBloc(),
            //   child: ImagesGrid(),
            // ),
            BlocBuilder<GalleryBloc, GalleryState>(
              builder: (context, state) {
                if (state is GalleryInitial) {
                  return const Center(
                    child: Text(
                      'Please make a request.',
                    ),
                  );
                } else if (state is GalleryLoadInProgress) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GalleryLoadSuccessState) {
                  // Expanded(child: ImagesGrid(Images)
                  return ImagesGrid(imageList: state.images);
                }

                return const SizedBox.shrink();
              },
            ),

            // Expanded(
            //   child: BlocBuilder<GalleryBloc, GalleryState>(
            //     builder: (context, state) {
            //       if (state is GalleryInitial) {
            //         return const Center(
            //           child: Text(
            //             'Please make a request.',
            //           ),
            //         );
            //       }

            // if (state is GalleryLoadInProgress) {
            //   return const Center(child: CircularProgressIndicator());
            // }

            // if (state is GalleryLoadSuccessState) {
            //   Expanded(child: ImagesGrid(Images)
            //   return ImagesGrid(imageList: state.images);
            // }

            // if (state is GalleryLoadFailure) {
            //   return const Center(
            //     child: Text('Error fetching images'),
            //   );
            // }

            // return const SizedBox.shrink();
            //   },
            // ),
            // ),
            // Expanded(child: ImagesGrid(Images),)
          ],
        ),
        // },
      ),
    );
    //   },
    // ),
    // );
  }
}
