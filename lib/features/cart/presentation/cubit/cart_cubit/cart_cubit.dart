import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/utils/app_strings.dart';
import 'package:supermarket/features/cart/data/models/cart_model.dart';
import 'package:supermarket/features/cart/domain/usecases/add_or_remove_from_cart_use_case.dart';
import 'package:supermarket/features/cart/domain/usecases/get_user_cart_use_case.dart';
import 'package:supermarket/features/cart/domain/usecases/update_cart_use_case.dart';
import 'package:supermarket/features/cart/presentation/cubit/cart_cubit/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit({
    required this.getUserCartUseCase,
    required this.addOrRemoveFromCartUseCase,
    required this.updateCartUseCase,
  }) : super(CartInitialState());
  GetUserCartUseCase getUserCartUseCase;
  AddOrRemoveFromCartUseCase addOrRemoveFromCartUseCase;
  UpdateCartUseCase updateCartUseCase;

  CartModel? cartModel;

  Future<void> getCart() async {
    emit(GetCartLoadingState());
    Either<Failure, CartModel> response =
        await getUserCartUseCase.call(token: AppStrings.userToken);

    response.fold((failure) {
      emit(GetCartErrorState(msg: _mapFailureToMsg(failure)));
    }, (cart) {
      for (var element in cart.data!.cartItems!) {
        if (!cartProducts.contains(element.product!.id)) {
          cartProducts.add(element.product!.id!);
        }
      }
      cartModel=cart;
      emit(GetCartSuccessState(cartModel: cart));
    });
  }

  List<int> cartProducts = [];

  Future<void> addOrRemoveFromCart(
      {required int? productId, required context}) async {
    emit(AddOrRemoveFromCartLoadingState());
    if (cartProducts.contains(productId!)) {
      cartProducts.remove(productId);
    } else if (!cartProducts.contains(productId)) {
      cartProducts.add(productId);
    }
    Either<Failure, AddOrRemoveCartModel> response =
        await addOrRemoveFromCartUseCase.call(
            token: AppStrings.userToken, productId: productId);
    response.fold((failure) {
      emit(AddOrRemoveFromCartErrorState(msg: _mapFailureToMsg(failure)));
    }, (done) {
      getCart();
      emit(AddOrRemoveFromCartSuccessState(msg: done.message));
    });
  }

  Future<void> updateCart(
      {required int? productId,
      required context,
      required int quantity,
      required int id}) async {
    if (quantity == 0) {
      addOrRemoveFromCart(productId: id, context: context);
    } else {
      emit(UpdateCartLoadingState());
      Either<Failure, AddOrRemoveCartModel> response =
          await updateCartUseCase.call(
              quantity: quantity,
              token: AppStrings.userToken,
              productId: productId);
       response.fold((failure) {
        emit(UpdateCartErrorState(msg: _mapFailureToMsg(failure)));
      }, (done) {
        getCart();
        emit(UpdateCartSuccessState(msg: done.message));
      });
    }
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
