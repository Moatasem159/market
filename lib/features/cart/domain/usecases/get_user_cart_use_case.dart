import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/cart/data/models/cart_model.dart';
import 'package:supermarket/features/cart/domain/repositories/cart_repository.dart';


class GetUserCartUseCase {
  CartRepository cartRepository;

  GetUserCartUseCase({required this.cartRepository});




  Future<Either<Failure, CartModel>> call({required String ? token})async{
    return cartRepository.getUserCart(token: token);
  }
}