import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepositories {
  Future <Either<Faliure,List<BookModel>>> searchBooksWithName(String searchText);

}