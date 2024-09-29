import 'package:auto_route/auto_route.dart';
import 'package:book_reader/features/my_books_bar/read_book/bloc/read_book_bloc.dart';
import 'package:book_reader/features/quotes_bar/quotes/bloc/quotes_bloc.dart';
import 'package:book_reader/ui/common/widgets/book_reader_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final _searchController = TextEditingController();
  late QuotesBloc _quotesBloc;

  @override
  void initState() {
    _quotesBloc = BlocProvider.of<QuotesBloc>(context);
    _quotesBloc.add(const QuotesEvent.load());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<ReadBookBloc, ReadBookState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          failure: (_) {},
          successfully: (_) => _quotesBloc.add(const QuotesEvent.load()),
        );
      },
      child: CustomScrollView(
        slivers: [
          BookReaderSliverAppBar(
            onSearch: () => _quotesBloc.add(
              QuotesEvent.search(query: _searchController.text),
            ),
            clearTextControllerTap: () => _quotesBloc.add(
              const QuotesEvent.load(),
            ),
            searchController: _searchController,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Цитаты',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.secondaryHeaderColor,
                ),
              ),
            ),
          ),
          BlocBuilder<QuotesBloc, QuotesState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SliverToBoxAdapter(
                  child: SizedBox(),
                ),
                loading: () => const SliverToBoxAdapter(
                  child: SizedBox(),
                ),
                loaded: (quotes) => SliverList.separated(
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(),
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              quotes[index].quote,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          IconButton(
                            onPressed: () => _quotesBloc
                                .add(QuotesEvent.delete(quote: quotes[index])),
                            icon: const Icon(Icons.close),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: quotes.length,
                ),
                failure: (error) => const SliverToBoxAdapter(
                  child: SizedBox(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
