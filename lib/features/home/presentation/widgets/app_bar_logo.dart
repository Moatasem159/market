import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supermarket/core/utils/app_strings.dart';

class AppBarLogoWidget extends StatelessWidget {
  const AppBarLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Market",style:Theme.of(context).textTheme.subtitle1!.copyWith(
          fontFamily: AppStrings.fontFamily,
          fontSize: 20,)),
        const SizedBox(width: 5,),
        const Icon(FontAwesomeIcons.cartShopping,size: 20,)
      ],
    );
  }
}