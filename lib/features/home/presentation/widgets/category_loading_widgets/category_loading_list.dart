import 'package:flutter/material.dart';
import 'package:supermarket/features/home/presentation/widgets/category_loading_widgets/category_loading_card.dart';

class CategoryLoadingList extends StatelessWidget {
  const CategoryLoadingList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 75,
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>const CategoryLoadingCard()
      ),
    );
  }
}
