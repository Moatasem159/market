import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/utils/app_strings.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';
import 'package:supermarket/features/login/domain/usecases/login.dart';
import 'package:supermarket/features/login/presentation/cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.sharedPreferences,required this.loginUseCase}) : super(LoginInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  IconData passSuffix = Icons.visibility_outlined;
  bool isHidden = true;

  void changePasswordVisibility() {
    emit(ChangePasswordVisibilityLoading());
    isHidden = !isHidden;
    passSuffix =
        isHidden ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityDone());
  }

  final LoginUseCase loginUseCase;
  final SharedPreferences sharedPreferences;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(UserLoginLoadingState());

    Either<Failure, UserModel> response =
        await loginUseCase(email: email, password: password);

    emit(response.fold(
        (failure) => UserLoginErrorState(msg: _mapFailureToMsg(failure)),
        (login) {

          sharedPreferences.setString(AppStrings.token, login.data!.token!).then((value){
            AppStrings.userToken=login.data!.token;
          });
          return UserLoginSuccessState(loginDataModel: login);
        }));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Failure";
      case CacheFailure:
        return "Cache Failure";

      default:
        return " error";
    }
  }
}
