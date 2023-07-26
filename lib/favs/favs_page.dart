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
            if (state is AllFavsLoading || state is RegistrationState) {
              return const CircularProgressIndicator();
            }
            if (state is AllFavsLoadSuccess && state.favImages.isNotEmpty) {
              return ImagesGrid(imageList: state.favImages);
            }

            return Container();
          },
        ),
      ),
    );
  }
}


      // BlocBuilder<GalleryBloc, GalleryState>(
      //   builder: (BuildContext context, state) {
      //     if (state is GalleryLoadSuccessState) {
      //       return GridView.builder(
      //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //           ),
      //           // itemCount: snapshot.data?.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             // ImageModel image = snapshot.data![index];
      //             ImageModel image = state.images[index];
      //             return GestureDetector(
      //               child: Image.network(image.fullUrl),
      //               onTap: () {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute<FullViewScreen>(builder: (context) {
                      //   return BlocProvider.value(
                      //     // value: context.G
                      //     value: galleryBloc,
                      //     child: FullViewScreen(image: image),
                      //   );
                      // }));
          //           },
          //         );
          //       }
          //   );
          // }
            // return Expanded(
            //   child: ImagesGrid(
            //     imageList: snapshot.data!,
            //   ),
            // );
          // } else if (snapshot.hasError) {
          //   return Text(snapshot.error.toString());
          // } else if (snapshot.data == null) {
          //   return const Center(
          //     child: Text(
          //       "No Favorites yet",
          //     ),
          //   );
          // }
          // return Center(child: CircularProgressIndicator());
        // },
      // ),
    // );
//   }
// }
