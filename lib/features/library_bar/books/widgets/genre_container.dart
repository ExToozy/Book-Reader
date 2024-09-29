import 'package:book_reader/domain/models/genre.dart';
import 'package:flutter/material.dart';

class GenreContainer extends StatefulWidget {
  const GenreContainer({
    super.key,
    required this.genre,
    required this.isSelected,
  });

  final Genre genre;
  final bool isSelected;

  @override
  State<GenreContainer> createState() => _GenreContainerState();
}

class _GenreContainerState extends State<GenreContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Color.fromARGB(255, 233, 224, 224),
              ),
              child: Image(
                image: AssetImage(widget.genre.assetName),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.genre.name,
              style: TextStyle(
                color: widget.isSelected
                    ? Theme.of(context).disabledColor
                    : Theme.of(context).secondaryHeaderColor,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
