import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

// what will happened in home
abstract class HomeRepo {
  Future<Either<Faliure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Faliure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Faliure, List<BookModel>>> fetchSimilarBooks({required String category});
}
