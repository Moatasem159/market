import 'package:flutter/material.dart';
import 'package:supermarket/config/routes/app_routes.dart';
import 'package:supermarket/core/utils/app_colors.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.themeScreenRoute),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(5),
              width: 400,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: const [
                  Text("App Theme"),
                  Spacer(),
                  Icon(Icons.brightness_4_outlined),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.profileScreenRoute),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(5),
              width: 400,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: const [
                  Text("Account"),
                  Spacer(),
                  Icon(Icons.account_circle_outlined),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
