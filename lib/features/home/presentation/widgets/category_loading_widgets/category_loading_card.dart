import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class CategoryLoadingCard extends StatelessWidget {
  const CategoryLoadingCard({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[500]!,
        highlightColor:Colors.grey[100]!,
        period:const Duration(seconds: 2) ,
        child: Column(
          children: [
            Container(
              color: Colors.grey.withOpacity(.5),
              height: 40,
              width: 40,
            ),
            const SizedBox(height: 5,),
            Container(
                width: 60,
                height: 15,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(10)

              ),
            )
          ],
        ),
      ),
    );
  }
}
