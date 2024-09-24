import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repositories/search_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchRepositoriesImplementation implements SearchRepositories {
  final ApiService apiService;

  SearchRepositoriesImplementation({required this.apiService});
  @override
  Future<Either<Faliure, List<BookModel>>> searchBooksWithName(
      String searchText) async {
    try {
      List<BookModel> books = [];
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$searchText');
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          debugPrint('e: ${e}');
        }
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioException(e));
      } else {
        return Left(ServerFaliure(errorMessage: e.toString()));
      }
    }
  }
}
