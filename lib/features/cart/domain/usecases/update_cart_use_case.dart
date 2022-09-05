import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/cart/data/models/cart_model.dart';
import 'package:supermarket/features/cart/domain/repositories/cart_repository.dart';

class UpdateCartUseCase{


  CartRepository cartRepository;

  UpdateCartUseCase({required this.cartRepository});

  Future<Either<Failure,AddOrRemoveCartModel>> call({required String ?token,required int ?productId,required int quantity})
  {
    return cartRepository.updateCart(token: token, productId: productId,quantity: quantity);
  }


}