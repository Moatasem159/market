import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supermarket/config/routes/app_routes.dart';
import 'package:supermarket/core/utils/app_colors.dart';
import 'package:supermarket/core/widgets/buttons.dart';
import 'package:supermarket/core/widgets/textformfield.dart';
import 'package:supermarket/features/login/presentation/cubit/login_cubit.dart';
import 'package:supermarket/features/login/presentation/cubit/login_states.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();


    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context, state) {
        if(state is UserLoginSuccessState) {
          if(state.loginDataModel.status!) {
            Fluttertoast.showToast(
                msg: state.loginDataModel.message!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.orange,
                textColor: Colors.black,
                fontSize: 16.0);
            Navigator.of(context).pushNamedAndRemoveUntil(Routes.homeScreenRoute, (route) => false);
            if(kDebugMode){
              print(state.loginDataModel.data!.token!);
            }
          }
          else if(!state.loginDataModel.status!) {
            if(kDebugMode){
              print(state.loginDataModel.message);
            }

            Fluttertoast.showToast(
                msg: state.loginDataModel.message!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.black,
                fontSize: 16.0);
          }
        }
      },
      builder: (context,state){
        return Form(
          key: formKey,
            child: Column(
              children: [
                MainTextFormField(
                    controller:BlocProvider.of<LoginCubit>(context).emailController,
                    inputType: TextInputType.emailAddress,
                    readOnly: false,
                    prefixIcon: Icons.email_outlined,
                    context: context,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "E-mail is required";
                      } else {
                        return null;
                      }
                    },
                    hintText: "E-mail",
                    obscure: false),
                const SizedBox(height: 6),
                MainTextFormField(
                    controller:BlocProvider.of<LoginCubit>(context).passwordController,
                    inputType: TextInputType.visiblePassword,
                    readOnly: false,
                    suffixIcon: GestureDetector(
                        onTap: () => BlocProvider.of<LoginCubit>(context).changePasswordVisibility(),
                        child: Icon(BlocProvider.of<LoginCubit>(context).passSuffix,
                          color: Theme.of(context).textTheme.subtitle1!.color,)),
                    prefixIcon: Icons.phone,
                    context: context,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      } else {
                        return null;
                      }
                    },
                    hintText: "Password",
                    obscure: BlocProvider.of<LoginCubit>(context).isHidden),
                const SizedBox(height: 10),
                BuildCondition(
                  condition:state is !UserLoginLoadingState ,
                  builder:(context){
                    return Center(
                        child: MainButton(
                          onPressed: (){
                            if(formKey.currentState!.validate())
                              {
                                BlocProvider.of<LoginCubit>(context).userLogin(
                                    email: BlocProvider.of<LoginCubit>(context).emailController.text,
                                    password: BlocProvider.of<LoginCubit>(context).passwordController.text);
                              }
                          },
                          label: "SIGN UP",
                        ));
                  },
                  fallback: (context){
                    return SpinKitCircle(
                      color: AppColors.primaryColor,
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ));
      },
    );
  }
}
