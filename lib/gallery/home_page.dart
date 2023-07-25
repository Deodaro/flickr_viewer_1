// import 'package:flickr_viewer/bloc/f_viewer_bloc.dart';
// import 'package:flickr_viewer/bloc/f_viewer_event.dart';
// import 'package:flickr_viewer/services/images_repository.dart';
// import 'package:flickr_viewer/bloc/favs/favs_bloc.dart';
import 'package:flickr_viewer/favs/favs_page.dart';
import 'package:flickr_viewer/gallery/bloc/gallery_bloc.dart';
import 'package:flickr_viewer/widgets/images_greed.dart';
import 'package:flickr_viewer/widgets/search_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class HomePage extends StatelessWidget {
//   // const HomePage({Key? key}) : super(key: key);
//
//   final imagesRepository = ImagesRepository();
//
//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider(
//       create: (context) => ImagesRepository(),
//       child: BlocProvider<FViewerBloc>(
//         create: (context) => imagesRepository(),
//             // FViewerBloc(imagesRepository),
//               // ..add(LoadImagesEvent('cats')),
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('User List'),
//             centerTitle: true,
//           ),
//           backgroundColor: Colors.white,
//           body: const Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SearchField(),
//               // ActionButtons(),
//               Expanded(
//                 child: PhotoGreed(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final favsBloc = BlocProvider.of<FavsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute<FavsPage>(
                    builder: (context) {
                      return const FavsPage();
                    }
                  ),
              );
            },
            icon: const Icon(Icons.bookmarks_outlined),
          ),
        ],
      ),
      // body: BlocBuilder<GalleryBloc, GalleryState>(
      body: Column(
        // builder: (context, state) {
        //   return Column(
        children: [
          const SearchPanel(),
          // ImagesGreed(),
          // BlocProvider(
          //   create: (BuildContext context) => GalleryBloc(),
          //   child: ImagesGreed(),
          // ),
          Expanded(child: BlocBuilder<GalleryBloc, GalleryState>(
            builder: (context, state) {
              if (state is GalleryInitial) {
                return const Center(
                  child: Text(
                    'Please make a request.',
                  ),
                );
              }

              if (state is GalleryLoadInProgress) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is GalleryLoadSuccess) {
                // Expanded(child: ImagesGreed(Images)
                return ImagesGreed(imageList: state.images);
              }

              if (state is GalleryLoadFailure) {
                return const Center(
                  child: Text('Error fetching images'),
                );
              }

              return const SizedBox.shrink();
            },
          ),
          )
          // Expanded(child: ImagesGreed(Images),)
        ],
      ),
      // },
      // ),
    );
  }
}
