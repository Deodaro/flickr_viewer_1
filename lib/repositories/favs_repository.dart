import 'package:hive/hive.dart';
import 'package:flickr_viewer/models/image_model_base.dart';

class FavsRepository {
  late Box<ImageModelBase> _favImages;

  Future<void> init() async {
    _favImages = await Hive.openBox<ImageModelBase>('favsBox');
  }

  List<ImageModelBase> getAllFavImages() => _favImages.values.toList();

  void addFavImage(final ImageModelBase image) {
    _favImages.add(image);
  }

  Future<void> removeFavImage(final int id) async {
    final imageToRemove = _favImages.values.firstWhere((el) => el.id == id);
    await imageToRemove.delete();
  }
}
