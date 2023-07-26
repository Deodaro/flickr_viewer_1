import 'package:flickr_viewer/gallery/bloc/gallery_bloc.dart';
import 'package:flickr_viewer/models/image_model_base.dart';
import 'package:flickr_viewer/widgets/full_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesGrid extends StatelessWidget {
  final List<ImageModelBase> imageList;

  const ImagesGrid({Key? key, required this.imageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryBloc, GalleryState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: imageList.length,
          itemBuilder: (BuildContext context, int index) {
            final ImageModelBase image = imageList[index];

            return GestureDetector(
              child: Image.network(image.fullUrl),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<FullViewScreen>(
                    builder: (context) {
                      return BlocProvider.value(
                        value: BlocProvider.of<GalleryBloc>(context),
                        child: FullViewScreen(image: image),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
