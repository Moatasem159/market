import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductLoadingCard extends StatelessWidget {
   const ProductLoadingCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[500]!,
        highlightColor:Colors.grey[100]!,
        period:const Duration(seconds: 2),
        child: Container(
          height: 230,
          width: 200,
          decoration:BoxDecoration(
            color: Colors.grey.withOpacity(.5),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
