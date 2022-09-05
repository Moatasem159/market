import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/exceptions.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/network/network_info.dart';
import 'package:supermarket/features/cart/data/datasource/cart_data_source.dart';
import 'package:supermarket/features/cart/data/models/cart_model.dart';
import 'package:supermarket/features/cart/domain/repositories/cart_repository.dart';


class CartRepositoryImpl implements CartRepository{
  final NetworkInfo networkInfo;
  final CartDataSource cartDataSource;

  CartRepositoryImpl({required this.networkInfo, required this.cartDataSource});


  @override
  Future<Either<Failure, CartModel>> getUserCart({required String? token}) async{
    try {
      final cart = await cartDataSource.getUserCart(token: token);
      return Right(cart);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AddOrRemoveCartModel>> addOrRemoveFromCart({required String? token, required int? productId}) async{
    try {
      final cart = await cartDataSource.addOrRemoveFromCart(token: token,productId: productId);
      return Right(cart);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AddOrRemoveCartModel>> updateCart({required String? token, required int? productId,required int quantity}) async {
    try {
      final cart = await cartDataSource.updateCart(token: token,productId: productId,quantity: quantity);
      return Right(cart);
    } on ServerException {
      return Left(ServerFailure());
    }
  }





}