import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/cart/data/models/cart_model.dart';

abstract class CartRepository{


Future<Either<Failure,CartModel>> getUserCart({required String ?token});
Future<Either<Failure,AddOrRemoveCartModel>> addOrRemoveFromCart({required String ?token,required int ?productId});
Future<Either<Failure,AddOrRemoveCartModel>> updateCart({required String ?token,required int ?productId,required int quantity});


}