import 'package:flutter/material.dart';

class ParagraphListItem extends StatelessWidget {
  const ParagraphListItem({
    super.key,
    required this.paragraph,
  });

  final String paragraph;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        paragraph,
        style: theme.textTheme.bodyLarge,
      ),
    );
  }
}
