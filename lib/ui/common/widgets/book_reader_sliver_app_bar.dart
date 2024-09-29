import 'package:book_reader/ui/common/widgets/search_books_bottom_sheet.dart';
import 'package:book_reader/ui/common/widgets/search_button.dart';
import 'package:flutter/material.dart';

class BookReaderSliverAppBar extends StatelessWidget {
  const BookReaderSliverAppBar({
    super.key,
    required this.searchController,
    this.onSearch,
    required this.clearTextControllerTap,
  });
  final VoidCallback clearTextControllerTap;
  final VoidCallback? onSearch;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 2,
      floating: true,
      snap: true,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      title: Text(
        'BookReader',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(58),
        child: Column(
          children: [
            SearchButton(
              clearTextControllerTap: clearTextControllerTap,
              searchController: searchController,
              onTap: () => _showSearchBottomSheet(
                context,
                searchController,
                onSearch,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showSearchBottomSheet(BuildContext context,
      TextEditingController controller, VoidCallback? onSearch) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => SearchBooksBottomSheet(
        onSearch: onSearch,
        controller: controller,
      ),
    );
  }
}
