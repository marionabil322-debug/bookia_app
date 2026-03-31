import 'package:bloc/bloc.dart';
import 'package:bookia/core/networking/api_result.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/foundation.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit({required this.repo}) : super(AuthCubitInitial());
  final AuthRepo repo;

  void login({required String email, required String password}) async {
    emit(AuthLoadingState());
    final response = await repo.login(email: email, password: password);

    response.when(
      success: (data) {
        emit(AuthSuccessState());
      },
      error: (error) {
        emit(AuthErrorState(error));
      },
    );
  }
}
