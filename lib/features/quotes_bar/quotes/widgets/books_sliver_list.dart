import 'package:auto_route/auto_route.dart';
import 'package:book_reader/domain/models/book.dart';
import 'package:book_reader/router/router.dart';
import 'package:book_reader/ui/common/widgets/book_card.dart';
import 'package:flutter/material.dart';

class BooksSliverList extends StatelessWidget {
  const BooksSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) => PreferredSize(
        preferredSize: const Size.fromWidth(200),
        child: BookCard(
          onTap: () => AutoRouter.of(context).navigate(
            BookQuotesRoute(
              book: Book(
                  name:
                      'Осторожно – вишинг! О кибермошенниках предупреждает Дрогичинский РОВД',
                  author: 'К. Т. Долбаёб',
                  imageLink: 'https://avidreaders.ru/pics/2/1/1058821.jpeg'),
            ),
          ),
          book: Book(
              name:
                  'Осторожно – вишинг! О кибермошенниках предупреждает Дрогичинский РОВД',
              author: 'К. Т. Долбаёб',
              imageLink: 'https://avidreaders.ru/pics/2/1/1058821.jpeg'),
          orientation: Axis.horizontal,
        ),
      ),
    );
  }
}
