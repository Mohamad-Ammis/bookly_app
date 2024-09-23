import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit({required this.homeRepo}) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    try {
      emit(SimilarBooksLoading());
      var result = await homeRepo.fetchSimilarBooks(category: category);
      result.fold((faliure) {
        try {
          emit(SimilarBooksFailure(errMessage: faliure.errorMessage));
        } catch (e) {
          debugPrint('e: ${e}');
        }
      }, (books) {
        try {
        emit(SimilarBooksSuccess(books: books));
        } catch (e) {
          debugPrint('e: ${e}');
        }
      });
    } on Exception catch (e) {
      debugPrint('e: ${e}');
    }
  }
}
