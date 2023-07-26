import 'package:flickr_viewer/gallery/bloc/gallery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPanel extends StatelessWidget {
  const SearchPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryBloc, GalleryState>(
      builder: (context, state) {
        return TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search',
            filled: true,
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            context.read<GalleryBloc>().add(SearchStartEvent(value));
          },
        );
      },
    );
  }
}
