import 'package:book_reader/ui/common/widgets/base_bottom_sheet.dart';
import 'package:book_reader/ui/search/bloc/search_history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksBottomSheet extends StatefulWidget {
  const SearchBooksBottomSheet({
    super.key,
    required this.controller,
    this.onSearch,
  });

  final TextEditingController controller;
  final VoidCallback? onSearch;

  @override
  State<SearchBooksBottomSheet> createState() => _SearchBooksBottomSheetState();
}

class _SearchBooksBottomSheetState extends State<SearchBooksBottomSheet> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchHistoryBloc>(context).add(
      const SearchHistoryEvent.started(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseBottomSheet(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.hintColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      onSubmitted: (value) {
                        if (widget.onSearch != null) {
                          widget.onSearch!();
                        }
                        BlocProvider.of<SearchHistoryBloc>(context).add(
                          SearchHistoryEvent.add(query: widget.controller.text),
                        );
                      },
                      textInputAction: TextInputAction.search,
                      controller: widget.controller,
                      decoration: InputDecoration(
                        hintText: 'Начни вводить слово...',
                        hintStyle: TextStyle(
                          color: theme.hintColor.withOpacity(0.5),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    if (widget.onSearch != null) {
                      widget.onSearch!();
                    }
                    BlocProvider.of<SearchHistoryBloc>(context).add(
                      SearchHistoryEvent.add(query: widget.controller.text),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(height: 1),
          BlocBuilder<SearchHistoryBloc, SearchHistoryState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (history) => Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                      trailing: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () =>
                            BlocProvider.of<SearchHistoryBloc>(context).add(
                          SearchHistoryEvent.delete(
                            query: history[index],
                          ),
                        ),
                      ),
                      title: Text(history[index].query),
                      onTap: () {
                        widget.controller.text = history[index].query;
                        if (widget.onSearch != null) {
                          widget.onSearch!();
                        }
                      },
                    ),
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemCount: history.length,
                  ),
                ),
                failure: () => const Text('Ошибка при загрузке :('),
              );
            },
          )
        ],
      ),
    );
  }
}
