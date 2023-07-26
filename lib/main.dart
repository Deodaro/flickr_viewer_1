import 'package:flickr_viewer/app.dart';
import 'package:flickr_viewer/models/image_model_base.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ImageModelBaseAdapter());

  runApp(const App());
}
