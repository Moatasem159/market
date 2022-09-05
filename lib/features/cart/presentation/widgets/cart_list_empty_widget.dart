import 'package:flutter/material.dart';

class CartListEmpty extends StatelessWidget {
  const CartListEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.remove_shopping_cart_outlined,size: 100,color: Colors.grey,),
          SizedBox(height: 10,),
          Text('No Item in Cart',style:TextStyle(
              fontSize: 20
          ),)
        ],
      ),
    );
  }
}