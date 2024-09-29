import 'package:auto_route/auto_route.dart';
import 'package:book_reader/domain/models/book_detail.dart';
import 'package:book_reader/router/router.dart';
import 'package:flutter/material.dart';

class DownloadBookNavigationBar extends StatelessWidget {
  const DownloadBookNavigationBar({
    super.key,
    required this.book,
  });
  final BookDetail book;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 70,
      width: double.infinity,
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)],
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Material(
        elevation: 2,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(theme.primaryColor),
                ),
                onPressed: () =>
                    AutoRouter.of(context).navigate(DownloadRoute(book: book)),
                child: Text(
                  'Скачать книгу',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.disabledColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
