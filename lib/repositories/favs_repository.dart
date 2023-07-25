import 'dart:math';

import 'package:hive/hive.dart';
import 'package:flickr_viewer/models/image_model.dart';

class FavsRepository{
  late Box<ImageModel> _favImages;

  Future<void> init() async {
    Hive.registerAdapter(ImageModelAdapter());
    _favImages = await Hive.openBox<ImageModel>('favsBox');
  }

  List<ImageModel> getAllFavImages() {
    final favImages = _favImages.values;
    return favImages.toList();
  }

  void addFavImage(final ImageModel image) {
    image.isFav = true;
    print(image);
    _favImages.add(image);
  }

  Future<void> removeFavImage(final int id) async {
    final imageToRemove = _favImages.values.firstWhere((el) => el.id == id);
    await imageToRemove.delete();
  }
}

