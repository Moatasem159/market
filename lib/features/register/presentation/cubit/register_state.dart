import 'package:equatable/equatable.dart';
import 'package:supermarket/features/register/data/models/register_model.dart';


abstract class RegisterStates extends Equatable{


  const RegisterStates();
  @override
  List<Object>get props=>[];
}



class RegisterInitialState extends RegisterStates{}

class ChangePasswordVisibilityLoading extends RegisterStates{}
class ChangePasswordVisibilityDone extends RegisterStates{}




class UserRegisterLoadingState extends RegisterStates{}
class UserRegisterSuccessState extends RegisterStates{

  final RegisterDataModel registerDataModel;

  const UserRegisterSuccessState({required this.registerDataModel});
  @override
  List<Object>get props=>[registerDataModel];



}
class UserRegisterErrorState extends RegisterStates{

  final String msg;

  const UserRegisterErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];






}
