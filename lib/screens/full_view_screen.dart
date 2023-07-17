import 'package:flutter/material.dart';

class FullViewScreen extends StatelessWidget {
  const FullViewScreen({super.key});

  static const routeName = '/full';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(args.imageUrl),
              fit: BoxFit.contain,
            ),
          ),
        ));
  }
}

class ScreenArguments {
  final String imageUrl;

  ScreenArguments(this.imageUrl);
}
