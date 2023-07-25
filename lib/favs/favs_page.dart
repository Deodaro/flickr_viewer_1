import 'package:flickr_viewer/gallery/bloc/gallery_bloc.dart';
import 'package:flickr_viewer/models/image_model.dart';
import 'package:flickr_viewer/screens/full_view_screen.dart';
import 'package:flickr_viewer/widgets/images_greed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavsPage extends StatelessWidget {
  const FavsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final FavsBloc favsBloc = BlocProvider.of<FavsBloc>(context);
    // favsBloc.getAllFavImages();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocBuilder<GalleryBloc, GalleryState>(
        // future: DBProvider.db.getAllFavImages(),
        builder: (BuildContext context, state) {
          // if (snapshot.hasData) {
          if (state is GalleryLoadSuccess) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                // itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  // ImageModel image = snapshot.data![index];
                  ImageModel image = state.images[index];
                  return GestureDetector(
                    child: Image.network(image.fullUrl),
                    onTap: () {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute<FullViewScreen>(builder: (context) {
                      //   return BlocProvider.value(
                      //     // value: context.G
                      //     value: galleryBloc,
                      //     child: FullViewScreen(image: image),
                      //   );
                      // }));
                    },
                  );
                }
            );
          }
            // return Expanded(
            //   child: ImagesGreed(
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
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
