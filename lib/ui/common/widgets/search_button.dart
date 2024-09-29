import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({
    super.key,
    required this.onTap,
    required this.searchController,
    required this.clearTextControllerTap,
  });

  final VoidCallback onTap;
  final VoidCallback clearTextControllerTap;
  final TextEditingController searchController;

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search_rounded),
                  const SizedBox(width: 12),
                  AnimatedBuilder(
                    animation: widget.searchController,
                    builder: (context, child) => Text(
                      widget.searchController.text.isEmpty
                          ? 'Поиск...'
                          : widget.searchController.text,
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).hintColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: widget.searchController,
            builder: (context, child) => widget.searchController.text.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      widget.searchController.clear();
                      widget.clearTextControllerTap();
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(bottom: 8).copyWith(right: 16),
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
