import 'package:equatable/equatable.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';


abstract class LoginStates extends Equatable{


  const LoginStates();
  @override
  List<Object>get props=>[];
}



class LoginInitialState extends LoginStates{}

class ChangePasswordVisibilityLoading extends LoginStates{}
class ChangePasswordVisibilityDone extends LoginStates{}


class UserLoginLoadingState extends LoginStates{}
class UserLoginSuccessState extends LoginStates{


  final UserModel loginDataModel;

  const UserLoginSuccessState({required this.loginDataModel});
  @override
  List<Object>get props=>[loginDataModel];



}
class UserLoginErrorState extends LoginStates{
  final String msg;
  const UserLoginErrorState({required this.msg});
  @override
  List<Object>get props=>[msg];
}