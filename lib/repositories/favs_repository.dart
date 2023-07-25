import 'package:hive/hive.dart';
import 'package:flickr_viewer/models/image_model.dart';

class FavsRepository{
  late Box<ImageModel> _favImages;

  Future<void> init() async {
    // Hive.registerAdapter(FavsAdapter());
    _favImages = await Hive.openBox<ImageModel>('fav_images');
  }

  List<ImageModel> getAllFavImages() {
    final favImages = _favImages.values;
    return favImages.toList();
  }

  void addFavImage(final ImageModel image) {
    _favImages.add(image);
  }

  Future<void> removeFavImage(final int id) async {
    final imageToRemove = _favImages.values.firstWhere((el) => el.id == id);
    await imageToRemove.delete();
  }


//   final DatabaseController dbController = DatabaseController();
//
//   Future getAllFavImages() => dbController.getAllFavImages();
//
//   Future insertFavImage(ImageModel favImage) => dbController.createFavImage(favImage);
//
//   Future deleteFavImage(int index) => dbController.deleteFavImage(index);
}

