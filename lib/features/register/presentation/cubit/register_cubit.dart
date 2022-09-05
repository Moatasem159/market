import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/register/data/models/register_model.dart';
import 'package:supermarket/features/register/domain/usecases/register.dart';
import 'package:supermarket/features/register/presentation/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({required this.register}) : super(RegisterInitialState());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  IconData passSuffix = Icons.visibility_outlined;
  bool isHidden = true;

  void changePasswordVisibility() {
    emit(ChangePasswordVisibilityLoading());
    isHidden = !isHidden;
    passSuffix =
        isHidden ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityDone());
  }

  final RegisterUseCase register;

  Future<void> userRegister({
    required String email,
    required String password,
    required String name,
    required String phone}) async {
    emit(UserRegisterLoadingState());

    Either<Failure, RegisterDataModel> response = await register(
        email: email,
        phone: phone,
        name: name,
        password: password);

    emit(response.fold(
        (failure) => UserRegisterErrorState(msg: _mapFailureToMsg(failure)),
        (register) =>UserRegisterSuccessState(registerDataModel: register)));
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
