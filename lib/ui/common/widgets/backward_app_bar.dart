import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BackwardAppBar extends StatelessWidget {
  const BackwardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: GestureDetector(
          onTap: () => AutoRouter.of(context).maybePop(),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios_new),
                const SizedBox(width: 10),
                Text(
                  'Назад',
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
