import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppbar(),
                const SizedBox(
                  height: 30,
                ),
                BookDetailsSection(book: book),
                const Expanded(child: SimilarBooksSection())
              ],
            ),
          ),
        )
      ],
    );
  }
}
