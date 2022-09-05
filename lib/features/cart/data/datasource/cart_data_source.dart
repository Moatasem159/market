import 'package:supermarket/core/api/api_consumer.dart';
import 'package:supermarket/core/api/end_points.dart';
import 'package:supermarket/features/cart/data/models/cart_model.dart';

abstract class CartDataSource{
  
  Future<CartModel> getUserCart({required String? token});
  Future<AddOrRemoveCartModel> addOrRemoveFromCart({required String? token,required int? productId});
  Future<AddOrRemoveCartModel> updateCart({required String? token,required int? productId,required int quantity});
}



class CartDataSourceImpl implements CartDataSource{
  ApiConsumer apiConsumer;
  CartDataSourceImpl({required this.apiConsumer});

  @override
  Future<CartModel> getUserCart({required String? token}) async{
  
    final response=await apiConsumer.get(EndPoints.cart,token:token);
    return CartModel.fromJson(response);
  }

  @override
  Future<AddOrRemoveCartModel> addOrRemoveFromCart({required String? token, required int? productId})async {
    final response =await apiConsumer.post(EndPoints.cart,token: token,body: {
      "product_id":"$productId"
    });
    return AddOrRemoveCartModel.fromJson(response);
  }

  @override
  Future<AddOrRemoveCartModel> updateCart({required String? token, required int? productId,required int quantity})async {
    final response =await apiConsumer.put("${EndPoints.cart}/$productId",token: token,body: {
      "quantity":"$quantity"
    });
    return AddOrRemoveCartModel.fromJson(response);
  }
}