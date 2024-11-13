import 'package:bloc/bloc.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState().init());

  void search(String query) {
    // dont do anything

  }
}
