import 'package:equatable/equatable.dart';
import 'package:supermarket/features/home/data/models/home_model.dart';


abstract class HomeStates extends Equatable{
  @override
  List<Object?> get props => [];
}


class HomeInitialState extends HomeStates{}
class GetHomeLoadingState extends HomeStates{}
class GetHomeSuccessState extends HomeStates{


  final HomeModel homeModel;

  GetHomeSuccessState({required this.homeModel});
  @override
  List<Object>get props=>[homeModel];


}
class GetHomeErrorState extends HomeStates{


  final String msg;

  GetHomeErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}


