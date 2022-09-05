import 'package:flutter/material.dart';
import 'package:supermarket/config/routes/app_routes.dart';
import 'package:supermarket/core/utils/app_colors.dart';


class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child:ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal:0 )),
                fixedSize: MaterialStateProperty.all(const Size(200,54)),

            ),
            onPressed: (){
              Navigator.of(context).pushNamed(Routes.registerScreenRoute);
            },
            child:const Text("Start with email"),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text("Already have an account?",),
            const SizedBox(width: 5,),
            GestureDetector(
               onTap: () {
                 Navigator.of(context).pushNamed(Routes.loginScreenRoute);
               },
              child: const Text("sign in",
                  style:TextStyle(
                      decoration: TextDecoration.underline,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
