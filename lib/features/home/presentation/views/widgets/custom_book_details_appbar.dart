import 'package:bookly_app/features/home/presentation/manger/cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppbar extends StatelessWidget {
  const CustomBookDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              BlocProvider.of<SimilarBooksCubit>(context).state is SimilarBooksLoading?null:
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
            )),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
}
