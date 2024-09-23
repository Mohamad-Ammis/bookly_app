import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBookImage(
          image: book.volumeInfo.imageLinks?.thumbnail ?? '',
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          book.volumeInfo.title ?? '',
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          book.volumeInfo.authors?[0] ?? "Mohamad Ammis",
          style: Styles.textStyle18.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 38,
        ),
        const BookActions(),
      ],
    );
  }
}
