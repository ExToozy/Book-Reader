import 'package:auto_route/auto_route.dart';
import 'package:book_reader/features/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:book_reader/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.cardColor,
      body: AutoTabsRouter(
        routes: const [
          MyBooksRoute(),
          QuotesRoute(),
          BooksRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            backgroundColor: theme.cardColor,
            body: child,
            bottomNavigationBar:
                CustomBottomNavigationBar(tabsRouter: tabsRouter),
          );
        },
      ),
    );
  }
}
