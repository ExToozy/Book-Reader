import 'package:auto_route/auto_route.dart';
import 'package:book_reader/features/library_bar/download/bloc/download_bloc.dart';
import 'package:book_reader/features/my_books_bar/my_books/bloc/my_books_bloc.dart';
import 'package:book_reader/features/my_books_bar/my_books/widgets/my_books_sliver_grid.dart';
import 'package:book_reader/ui/common/widgets/book_reader_sliver_app_bar.dart';
import 'package:book_reader/ui/common/widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MyBooksScreen extends StatefulWidget {
  const MyBooksScreen({
    super.key,
  });

  @override
  State<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
  final _searchController = TextEditingController();
  late MyBooksBloc _myBooksBloc = BlocProvider.of<MyBooksBloc>(context);

  @override
  void initState() {
    super.initState();
    _myBooksBloc = BlocProvider.of<MyBooksBloc>(context);
    _myBooksBloc.add(const MyBooksEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloadBloc, DownloadState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          downloading: () {},
          downloaded: () {
            BlocProvider.of<MyBooksBloc>(context).add(
              const MyBooksEvent.newBookAdded(),
            );
          },
          failure: (error) {},
        );
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            BookReaderSliverAppBar(
              clearTextControllerTap: () =>
                  _myBooksBloc.add(const MyBooksEvent.started()),
              onSearch: () {
                _myBooksBloc.add(
                  MyBooksEvent.search(query: _searchController.text),
                );
                AutoRouter.of(context).maybePop();
              },
              searchController: _searchController,
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(
              child: HeaderText(text: 'Моя библиотека'),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: BlocBuilder<MyBooksBloc, MyBooksState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SliverToBoxAdapter(child: SizedBox()),
                    loading: () => const SliverFillRemaining(
                        child: Center(
                      child: CircularProgressIndicator(),
                    )),
                    loaded: (books) => MyBooksSliverGrid(
                      books: books,
                    ),
                    failure: (error) => SliverFillRemaining(
                        child: Center(
                      child: Text(error.toString()),
                    )),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _myBooksBloc.add(const MyBooksEvent.add()),
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
