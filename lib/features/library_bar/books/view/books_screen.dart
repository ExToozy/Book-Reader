import 'package:auto_route/auto_route.dart';
import 'package:book_reader/domain/models/book.dart';
import 'package:book_reader/features/library_bar/books/bloc/books_bloc.dart';
import 'package:book_reader/features/library_bar/books/models/genres_list.dart';
import 'package:book_reader/features/library_bar/books/widgets/genre_container.dart';
import 'package:book_reader/ui/common/widgets/book_reader_sliver_app_bar.dart';
import 'package:book_reader/ui/common/widgets/books_sliver_grid.dart';
import 'package:book_reader/ui/common/widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

@RoutePage()
class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final _searchController = TextEditingController();
  late ScrollController _scrollController;
  late BooksBloc booksBloc;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_loadNext);
    booksBloc = BlocProvider.of<BooksBloc>(context);
    booksBloc.add(const BooksEvent.started());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadNext() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _scrollController.keepScrollOffset;
      _scrollPosition = _scrollController.position.pixels;
      booksBloc.add(BooksEvent.load(books: booksBloc.state.books));
    }
  }

  int selectedGenreIndex = -1;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        BookReaderSliverAppBar(
          clearTextControllerTap: () =>
              booksBloc.add(const BooksEvent.search(query: '')),
          searchController: _searchController,
          onSearch: () {
            booksBloc.add(
              BooksEvent.search(query: _searchController.text),
            );
            setState(() {
              selectedGenreIndex = -1;
            });
            AutoRouter.of(context).maybePop();
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        const SliverToBoxAdapter(
          child: HeaderText(text: "Категории"),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 115,
            child: MasonryGridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              scrollDirection: Axis.horizontal,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              crossAxisCount: 2,
              itemCount: 12,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _changeSelectedGenre(index),
                  child: selectedGenreIndex == index
                      ? GenreContainer(
                          genre: genresList[index],
                          isSelected: true,
                        )
                      : GenreContainer(
                          genre: genresList[index],
                          isSelected: false,
                        ),
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: HeaderText(text: 'Результаты'),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: BlocBuilder<BooksBloc, BooksState>(
            builder: (context, state) {
              return state.when(
                initial: () => _handleInitialState(),
                loading: (query, page, books, genre) => _handleLoadingState(),
                loaded: (query, page, genre, books) =>
                    _handleLoadedState(books),
                failure: (query, page, error, genre) =>
                    _handleFailureState(error),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _handleLoadedState(List<Book> books) {
    _scrollController.jumpTo(_scrollPosition);
    _scrollPosition = 0.0;
    if (books.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: HeaderText(text: 'Ничего не найдено'),
        ),
      );
    }
    return BooksSliverGrid(books: books);
  }

  Widget _handleFailureState(error) {
    return SliverToBoxAdapter(child: Text(error.toString()));
  }

  Widget _handleLoadingState() {
    return const SliverFillRemaining(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _handleInitialState() {
    return const SliverToBoxAdapter(child: SizedBox());
  }

  void _changeSelectedGenre(int index) {
    setState(() {
      _searchController.text = '';
      if (selectedGenreIndex == index) {
        booksBloc.add(const BooksEvent.started());
        selectedGenreIndex = -1;
      } else {
        booksBloc.add(BooksEvent.searchGenre(genre: genresList[index].url));
        selectedGenreIndex = index;
      }
    });
  }
}
