import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supermarket/config/routes/app_routes.dart';
import 'package:supermarket/core/utils/app_strings.dart';
import 'package:supermarket/features/welcome/presentation/widgets/logo_widget.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Timer _timer;

  _goNext(){

    if(AppStrings.userToken==null)
      {
        Navigator.pushNamedAndRemoveUntil(context, Routes.welcomeScreenRoute, (route) => false);
      }
    else if(AppStrings.userToken!=null){
      Navigator.pushNamedAndRemoveUntil(context,Routes.mainScreenRoute, (route) => false);
    }

  }
  _startDelay(){
    _timer=Timer(
        const Duration(
            milliseconds: 2000
        ),
            ()=>_goNext()
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child:LogoWidget(),
      ),
    );
  }
}
