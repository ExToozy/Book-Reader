import 'dart:io';

import 'package:book_reader/domain/models/book.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    this.orientation = Axis.vertical,
    this.onTap,
    required this.book,
    this.centerName = false,
    this.isLocalSaved = false,
    this.onDeleteTap,
  });
  final bool isLocalSaved;
  final bool centerName;
  final Axis orientation;
  final Book book;
  final VoidCallback? onTap;
  final VoidCallback? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: orientation == Axis.vertical
              ? Column(
                  crossAxisAlignment: centerName
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (onTap != null) {
                          onTap!();
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: isLocalSaved
                            ? Image.file(
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .hintColor
                                              .withOpacity(0.3)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset(
                                        'assets/no_cover_image.png'),
                                  );
                                },
                                File(book.imageLink),
                                height: 250,
                                width: 180,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                book.imageLink,
                                height: 250,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      book.name,
                      textAlign:
                          centerName ? TextAlign.center : TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      book.author,
                      textAlign:
                          centerName ? TextAlign.center : TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Theme.of(context).hintColor),
                    ),
                  ],
                )
              : Container(
                  padding: const EdgeInsets.all(8),
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: Theme.of(context).hintColor.withOpacity(0.05)),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          book.imageLink,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                book.name,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                book.author,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Theme.of(context).hintColor),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
        isLocalSaved
            ? Positioned(
                right: 3,
                top: 3,
                child: GestureDetector(
                  onTap: () {
                    if (onDeleteTap != null) {
                      onDeleteTap!();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(),
                    ),
                    height: 34,
                    width: 34,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
