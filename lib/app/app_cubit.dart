import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit(super.initialState);

  // final AuthRepo authRepo;
  //
  // AppCubit({required this.authRepo}) : super(const AppState()) {
  //   authRepo.status.listen((authStatus) {
  //     emit(state.copyWith(authStatus: authStatus));
  //   });
  // }
}
