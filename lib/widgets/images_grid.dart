// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flickr_viewer/favs/bloc/favs_bloc.dart';
import 'package:flickr_viewer/gallery/bloc/gallery_bloc.dart';
import 'package:flickr_viewer/models/image_model.dart';
import 'package:flickr_viewer/models/image_model_base.dart';
// import 'package:flickr_viewer/repositories/favs_repository.dart';
// import 'package:flickr_viewer/screens/full_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// переделать
// добавить переключение сетки
// добавить подгрузку по pull
// добавить отступы вокруг карточек
class ImagesGrid extends StatelessWidget {
  final List<ImageModelBase> imageList;

  const ImagesGrid({Key? key, required this.imageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final galleryBloc = BlocProvider.of<GalleryBloc>(context);
    // final favsBloc = BlocProvider.of<FavsBloc>(context);
    // return BlocProvider(
    // create: (context) => FavsBloc(RepositoryProvider.of<FavsRepository>(context)),
    // child: BlocBuilder<FavsBloc, FavsState>(
    //   builder: (context, state) {
    // int _gridCount;
    return BlocConsumer<GalleryBloc, GalleryState>(
      // listenWhen: ,
      listener: (context, state) {
        // if (state is GridCount) {
          // _gridCount = state.count;
        // }
      },
      builder: (context, state) {
        // BlocProvider.of<GalleryBloc>(context).add(ToggleGridEvent(2));
        // if (state is GridCount) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            // itemCount: state.photos.length,
            itemCount: 40,
            itemBuilder: (BuildContext context, int index) {
              final ImageModelBase image = imageList[index];

              return GestureDetector(
                child: Image.network(image.fullUrl),
                onTap: () {
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
        // }

        // return Container();
      },
    );
    // },
    // ),
    // );
    // );
  }
}
