import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.cardName,
  });

  final String cardName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: const Text('L-side'),
      title: Text(
        cardName,
        style: theme.textTheme.bodyMedium,
      ),
      trailing: const Text('R-side'),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/info',
          arguments: cardName,
        );
      },
    );
  }
}
