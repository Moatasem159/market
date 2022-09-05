import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/core/widgets/buttons.dart';
import 'package:supermarket/features/register/presentation/widgets/register_form.dart';
import 'package:supermarket/features/welcome/presentation/widgets/logo_widget.dart';

import 'package:supermarket/injection_container.dart'as di;
import 'package:supermarket/features/register/presentation/cubit/register_cubit.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => di.sl<RegisterCubit>(),
      child: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
          child: Scaffold(
            body:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const SizedBox(height:36,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: MainBackButton(),
                  ),
                  const SizedBox(height:10,),
                  const LogoWidget(),
                  const SizedBox(height:25,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    child: Text("Register",style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 34,
                    )),
                  ),
                  const RegisterForm(),
                ],
              ),
            ),
          )),
    ),);
  }
}
