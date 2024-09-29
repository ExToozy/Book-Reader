class Book {
  Book({
    required this.name,
    required this.author,
    required this.imageLink,
    this.selfLink,
  });
  final String name;
  final String imageLink;
  final String author;
  final String? selfLink;
}
