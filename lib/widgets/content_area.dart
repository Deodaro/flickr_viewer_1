import 'package:flutter/material.dart';
// import 'package:flickr_viewer/repositories/flickr_viewer_repository.dart';
import 'package:flickr_viewer/repositories/models/photo.dart';
import 'package:flickr_viewer/widgets/image_card.dart';

class ContentArea extends StatelessWidget {
  const ContentArea({
    super.key,
    required this.imageList,
  });

  final List<Photo> imageList;
  final _columnsNumber = 2;

  // @override
  // State<ContentArea> createState() => _ContentAreaState();

  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: (imageList == null)
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _columnsNumber,
                ),
                itemCount: imageList.length,
                // for (int i = 0; i < _imageList!.length; i++)
                itemBuilder: (context, index) {
                  return ImageCard(
                    photo: imageList[index],
                  );
                },
              ),
      ),
    );
  }
}

// class _ContentAreaState extends State<ContentArea> {
  // final _columnsNumber = 2;

  // @override
  // Widget build(BuildContext context) {
  //   return Expanded(
  //     child: Scaffold(
  //       body: (_imageList == null)
  //           ? const Center(child: CircularProgressIndicator())
  //           : GridView.builder(
  //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: _columnsNumber,
  //               ),
  //               itemCount: _imageList!.length,
  //               // for (int i = 0; i < _imageList!.length; i++)
  //               itemBuilder: (context, index) {
  //                 return ImageCard(
  //                   photo: _imageList![index],
  //                 );
  //               },
  //             ),
  //     ),
  //   );
  // }
// }                  
