import 'package:equatable/equatable.dart';
import 'package:supermarket/features/home/domain/entities/banner.dart';
import 'package:supermarket/features/home/domain/entities/product.dart';

class HomeData extends Equatable{

  const HomeData({
    this.banners,
    this.products,
    this.ad,
  });

 final List<ApiBanner>? banners;
 final List<Product>? products;
 final String ?ad;
  @override
  List<Object?> get props => [banners,products,ad];
}


