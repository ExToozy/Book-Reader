import 'package:auto_route/auto_route.dart';
import 'package:book_reader/domain/models/book.dart';
import 'package:book_reader/features/quotes_bar/book_quotes/widgets/quote_list_item.dart';
import 'package:book_reader/ui/common/widgets/backward_app_bar.dart';
import 'package:book_reader/ui/common/widgets/book_card.dart';
import 'package:book_reader/ui/common/widgets/header_text.dart';
import 'package:flutter/material.dart';

var quotes = [
  'Человек, стремясь сбежать от постоянного гнета обстоятельств за границы выдуманного мира, постоянно его расширяет, что бы место хватило для всех ищущих убежища. Ну и попутно раскрывает способности своего мозга.',
  'Игровые миры по прежнему распространяются, а в Альфхейме растет мировое дерево. все мыслимые злодеи получили по заслугам.',
  'Человек, стремясь сбежать от постоянного гнета обстоятельств за границы выдуманного мира, постоянно его расширяет, что бы место хватило для всех ищущих убежища.',
  'Человек, стремясь сбежать от постоянного гнета обстоятельств за границы выдуманного мира, постоянно его расширяет, что бы место хватило для всех ищущих убежища. Ну и попутно раскрывает способности своего мозга.',
  'Игровые миры по прежнему распространяются, а в Альфхейме растет мировое дерево. все мыслимые злодеи получили по заслугам.',
  'Человек, стремясь сбежать от постоянного гнета обстоятельств за границы выдуманного мира, постоянно его расширяет, что бы место хватило для всех ищущих убежища.',
  'Человек, стремясь сбежать от постоянного гнета обстоятельств за границы выдуманного мира, постоянно его расширяет, что бы место хватило для всех ищущих убежища. Ну и попутно раскрывает способности своего мозга.',
  'Игровые миры по прежнему распространяются, а в Альфхейме растет мировое дерево. все мыслимые злодеи получили по заслугам.',
  'Человек, стремясь сбежать от постоянного гнета обстоятельств за границы выдуманного мира, постоянно его расширяет, что бы место хватило для всех ищущих убежища.'
];

@RoutePage()
class BookQuotesScreen extends StatelessWidget {
  const BookQuotesScreen({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const BackwardAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: BookCard(
              centerName: true,
              book: book,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverToBoxAdapter(child: HeaderText(text: 'Цитаты')),
          const SliverToBoxAdapter(child: SizedBox(height: 5)),
          SliverList.separated(
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            itemCount: quotes.length,
            itemBuilder: (context, index) {
              return quotes
                  .map(
                    (quote) => QuoteListItem(quote: quote),
                  )
                  .toList()[index];
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
