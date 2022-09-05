import 'package:equatable/equatable.dart';
import 'package:supermarket/features/cart/data/models/cart_model.dart';

abstract class CartStates extends Equatable{

  @override
  List<Object>get props=>[];
}


class CartInitialState extends CartStates{}


class GetCartLoadingState extends CartStates{}
class GetCartSuccessState extends CartStates{

  final CartModel cartModel;

  GetCartSuccessState({required this.cartModel});
  @override
  List<Object>get props=>[cartModel];

}
class GetCartErrorState extends CartStates{


  final String msg;

  GetCartErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}


class AddOrRemoveFromCartLoadingState extends CartStates{}
class AddOrRemoveFromCartSuccessState extends CartStates{

  final String msg;

  AddOrRemoveFromCartSuccessState({required this.msg});
  @override
  List<Object>get props=>[msg];

}
class AddOrRemoveFromCartErrorState extends CartStates{


  final String msg;

  AddOrRemoveFromCartErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}



class UpdateCartLoadingState extends CartStates{}
class UpdateCartSuccessState extends CartStates{

  final String msg;

  UpdateCartSuccessState({required this.msg});
  @override
  List<Object>get props=>[msg];

}
class UpdateCartErrorState extends CartStates{


  final String msg;

  UpdateCartErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}