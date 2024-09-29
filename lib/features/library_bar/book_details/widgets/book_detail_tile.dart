import 'package:flutter/material.dart';

class BookDetailTile extends StatelessWidget {
  const BookDetailTile({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.hintColor.withOpacity(0.5),
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
