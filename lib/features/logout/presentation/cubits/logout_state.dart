import 'package:equatable/equatable.dart';
import 'package:supermarket/features/logout/data/models/logout_model.dart';

abstract class LogoutStates extends Equatable {

  @override
  List<Object> get props => [];
}

class LogoutInitialState extends LogoutStates {}


class LogoutLoadingState extends LogoutStates {}

class LogoutSuccessState extends LogoutStates {

  final LogoutModel logoutModel;

  LogoutSuccessState({required this.logoutModel});

  @override
  List<Object> get props => [logoutModel];
}

class LogoutErrorState extends LogoutStates {

  final String msg;

  LogoutErrorState({required this.msg});

  @override
  List<Object> get props => [msg];
}