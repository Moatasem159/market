import 'package:flutter/material.dart';

class FavouriteListEmpty extends StatelessWidget {
  const FavouriteListEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.heart_broken,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'No Favorites Items',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
