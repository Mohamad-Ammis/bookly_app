import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_cubit_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {

  FeaturedBooksCubit(super.initialState, this.homeRepo);
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
        (faliure) => {
              emit(FeaturedBooksFailure(errMessage: faliure.errorMessage))
            }, (books) {
      emit(FeaturedBooksSuccess(books: books));
    });
  }
}
