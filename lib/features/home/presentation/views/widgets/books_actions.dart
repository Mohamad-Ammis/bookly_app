import 'package:bookly_app/core/utils/functions/launch_custom_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            text: 'Free',
          )),
          Expanded(
              child: CustomButton(
            onPressed: () async {
              await launchCustomUrl(context, book.volumeInfo.previewLink);
            },
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            fontSize: 16,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            text: book.volumeInfo.previewLink != null
                ? 'Free Preview'
                : 'not avaliable',
          )),
        ],
      ),
    );
  }
}
