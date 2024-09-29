import 'package:flutter/material.dart';

class QuoteListItem extends StatelessWidget {
  const QuoteListItem({
    super.key,
    required this.quote,
  });
  final String quote;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Expanded(
        child: Text(
          quote,
          style: theme.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
