import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supermarket/core/utils/app_colors.dart';
import 'package:supermarket/core/utils/app_strings.dart';


class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Market",style:Theme.of(context).textTheme.headline2!.copyWith(
            fontFamily: AppStrings.fontFamily,
            color: AppColors.primaryColor,)),
            const SizedBox(width: 5,),
            Icon(FontAwesomeIcons.cartShopping,color: AppColors.primaryColor,size: 32,)
          ],
        ),
        Text(
          "Welcome to Market your place for every thing.",style: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontSize: 15
        ),
        ),
      ],
    );
  }
}
