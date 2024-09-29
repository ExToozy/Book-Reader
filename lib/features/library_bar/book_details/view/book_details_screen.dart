import 'package:auto_route/auto_route.dart';
import 'package:book_reader/domain/models/book.dart';
import 'package:book_reader/domain/models/book_detail.dart';
import 'package:book_reader/features/library_bar/book_details/bloc/book_details_bloc.dart';
import 'package:book_reader/features/library_bar/book_details/widgets/book_detail_container.dart';
import 'package:book_reader/features/library_bar/book_details/widgets/download_book_navigation_bar.dart';
import 'package:book_reader/features/library_bar/book_details/widgets/paragraph_list_item.dart';
import 'package:book_reader/ui/common/widgets/backward_app_bar.dart';
import 'package:book_reader/ui/common/widgets/book_card.dart';
import 'package:book_reader/ui/common/widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key, required this.book});

  final Book book;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BookDetailsBloc>(context)
        .add(BookDetailsEvent.loadBook(book: widget.book));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsBloc, BookDetailsState>(
      builder: (context, state) {
        return Scaffold(
            body: state.when(
              initial: () => const SizedBox(),
              loading: () => const CustomScrollView(
                slivers: [
                  BackwardAppBar(),
                  SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ],
              ),
              loaded: (book) => _onLoadedState(book),
              failure: (e) => CustomScrollView(
                slivers: [
                  const BackwardAppBar(),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text(e.toString()),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: state.when(
                initial: () => const SizedBox(),
                loading: () => const SizedBox(),
                loaded: (book) => DownloadBookNavigationBar(
                      book: book,
                    ),
                failure: (error) => const SizedBox()));
      },
    );
  }

  CustomScrollView _onLoadedState(BookDetail book) {
    return CustomScrollView(
      slivers: [
        const BackwardAppBar(),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: Center(
            child: BookCard(
              centerName: true,
              book: widget.book,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: BookDetailContainer(book: book),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        const SliverToBoxAdapter(
          child: HeaderText(text: 'О книге'),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverList.builder(
          itemCount: book.paragraphs.length,
          itemBuilder: (context, index) {
            return book.paragraphs
                .map(
                  (paragraph) => ParagraphListItem(paragraph: paragraph),
                )
                .toList()[index];
          },
        )
      ],
    );
  }
}
