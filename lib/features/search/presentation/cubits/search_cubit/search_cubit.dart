import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repositories/search_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepositories) : super(SearchInitial());

  final SearchRepositories searchRepositories;
  Timer? _debounce;

  Future<void> searchBooksWithName({required String searchText}) async {
    try {
      emit(SearchLoading());
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () async {
        debugPrint(
            '*********************from Search Call******************************');
        var result = await searchRepositories.searchBooksWithName(searchText);
        result.fold(
          (failure) => emit(SearchFaliure(errMessage: failure.errorMessage)),
          (books) => emit(SearchSuccess(books: books)),
        );
      });
    } on Exception catch (e) {
      debugPrint('e: ${e}');
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
