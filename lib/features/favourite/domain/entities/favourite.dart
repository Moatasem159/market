import 'package:equatable/equatable.dart';
import 'package:supermarket/features/home/domain/entities/product.dart';



class Favourite extends Equatable{

  final int? id;
  final Product productData;

  const Favourite({required this.id,required  this.productData});





  @override
  List<Object?> get props => [id];
}