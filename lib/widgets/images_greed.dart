// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flickr_viewer/favs/bloc/favs_bloc.dart';
import 'package:flickr_viewer/gallery/bloc/gallery_bloc.dart';
import 'package:flickr_viewer/models/image_model.dart';
import 'package:flickr_viewer/repositories/favs_repository.dart';
import 'package:flickr_viewer/screens/full_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// переделать
// добавить переключение сетки
// добавить подгрузку по pull
// добавить отступы вокруг карточек
class ImagesGreed extends StatelessWidget {
  const ImagesGreed({Key? key, required this.imageList}) : super(key: key);

  final List<ImageModel> imageList;

  @override
  Widget build(BuildContext context) {
    // final galleryBloc = BlocProvider.of<GalleryBloc>(context);
    // final favsBloc = BlocProvider.of<FavsBloc>(context);
    return BlocProvider(
      create: (context) => FavsBloc(RepositoryProvider.of<FavsRepository>(context)),
      child: BlocBuilder<FavsBloc, FavsState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            // itemCount: state.photos.length,
            itemCount: 40,
            itemBuilder: (BuildContext context, int index) {
              final ImageModel image = imageList[index];

              return GestureDetector(
                child: Image.network(image.fullUrl),
                onTap: () {
                  print('tap');
                  // Navigator.of(context)
                  //     .push(
                  //     MaterialPageRoute<FullViewScreen>(builder: (context) {
                  //       return BlocProvider.value(
                  //         // value: context.G
                  //         value: galleryBloc,
                  //         child: FullViewScreen(image: image),
                  //       );
                  //     }));
                },
              );
            },
          );
        },
      ),
    );
    // );
  }
}
