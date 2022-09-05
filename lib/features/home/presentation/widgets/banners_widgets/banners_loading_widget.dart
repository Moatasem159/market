import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannersLoadingWidget extends StatelessWidget {
  const BannersLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor:Colors.grey[100]!,
      period:const Duration(seconds: 3) ,
      child: Container(
        color: Colors.grey.withOpacity(.5),
        height: 200,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}


