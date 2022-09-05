import 'package:flutter/material.dart';
import 'package:supermarket/features/welcome/presentation/widgets/logo_widget.dart';
import 'package:supermarket/features/welcome/presentation/widgets/sign_up_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:   const [
          LogoWidget(),
          SignUpWidget(),
        ],
      ),

      ),
    );
  }
}
