import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/cart/data/models/cart_model.dart';
import 'package:supermarket/features/cart/domain/repositories/cart_repository.dart';

class AddOrRemoveFromCartUseCase{


  CartRepository cartRepository;

  AddOrRemoveFromCartUseCase({required this.cartRepository});

  Future<Either<Failure, AddOrRemoveCartModel>> call({required String ? token,required int? productId})async{
    return cartRepository.addOrRemoveFromCart(token: token, productId: productId);
  }
}