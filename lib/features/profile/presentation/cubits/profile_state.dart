import 'package:equatable/equatable.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';
import 'package:supermarket/features/profile/data/models/address_model.dart';

abstract class ProfileStates extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileInitialState extends ProfileStates {}

class GetProfileLoadingState extends ProfileStates {}

class GetProfileSuccessState extends ProfileStates {


  final UserModel userModel;

  GetProfileSuccessState({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class GetProfileErrorState extends ProfileStates {


  final String msg;

  GetProfileErrorState({required this.msg});

  @override
  List<Object> get props => [msg];
}


class GetUserAddressesLoadingState extends ProfileStates {}

class GetUserAddressesSuccessState extends ProfileStates {

  final AddressModel addressModel;

  GetUserAddressesSuccessState({required this.addressModel});

  @override
  List<Object> get props => [addressModel];
}

class GetUserAddressesErrorState extends ProfileStates {
  final String msg;

  GetUserAddressesErrorState({required this.msg});

  @override
  List<Object> get props => [msg];
}


class AddNewAddressLoadingState extends ProfileStates {}

class AddNewAddressSuccessState extends ProfileStates {

  final AddressModel addressModel;

  AddNewAddressSuccessState({required this.addressModel});

  @override
  List<Object> get props => [addressModel];

}

class AddNewAddressErrorState extends ProfileStates {

  final String msg;

  AddNewAddressErrorState({required this.msg});

  @override
  List<Object> get props => [msg];
}


class UpdateUserDataLoadingState extends ProfileStates {}

class UpdateUserDataSuccessState extends ProfileStates {

  final UserModel userModel;

  UpdateUserDataSuccessState({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class UpdateUserDataErrorState extends ProfileStates {

  final String msg;


  UpdateUserDataErrorState({required this.msg});

  @override
  List<Object> get props => [msg];
}