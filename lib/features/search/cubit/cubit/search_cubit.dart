import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:bookia/features/search/data/repo/search_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial()) {
    _searchSubject
        .debounceTime(Duration(milliseconds: 500))
        .distinct()
        .listen(search);
  }
  final _searchSubject = PublishSubject<String>();

  searchAction(String text) {
    _searchSubject.add(text);
  }

  void search(String text) async {
    try {
      if (text.trim().isEmpty) {
        emit(SearchInitial());
        return;
      }

      emit(SearchLoading());

      final response = await SearchRepo.search(text);

      if (response is BooksModel) {
        emit(SearchSuccess(response.data?.products ?? []));
      } else {
        emit(SearchError("Unexpected response"));
      }
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _searchSubject.close();
    return super.close();
  }
}
