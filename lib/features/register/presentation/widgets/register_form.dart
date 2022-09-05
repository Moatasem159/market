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
import 'package:supermarket/features/register/presentation/cubit/register_cubit.dart';
import 'package:supermarket/features/register/presentation/cubit/register_state.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    var cubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is UserRegisterSuccessState) {
          if (state.registerDataModel.status) {
            Fluttertoast.showToast(
                msg: state.registerDataModel.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.black,
                fontSize: 16.0);
            Navigator.of(context).pushNamed(Routes.loginScreenRoute);
          } else {

            if(kDebugMode) {
              print(state.registerDataModel.message);
            }
            Fluttertoast.showToast(
                msg: state.registerDataModel.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.black,
                fontSize: 16.0);

          }
        }
        else if (state is UserRegisterErrorState) {
          if(kDebugMode) {
            print(state.msg.toString());
          }
        }
      },
      builder: (context, state) {
        return Form(
            key: formKey,
            child: Column(
              children: [
                MainTextFormField(
                    controller: cubit.nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name is required";
                      } else {
                        return null;
                      }
                    },
                    inputType: TextInputType.name,
                    readOnly: false,
                    prefixIcon: Icons.account_circle_outlined,
                    context: context,
                    hintText: "Name",
                    obscure: false),
                const SizedBox(height: 6),
                MainTextFormField(

                    validator: (value) {
                      if (value!.isEmpty) {
                        return "E-mail is required";
                      } else {
                        return null;
                      }
                    },
                    controller: cubit.emailController,
                    inputType: TextInputType.emailAddress,
                    readOnly: false,
                    prefixIcon: Icons.email_outlined,
                    context: context,
                    hintText: "E-mail",
                    obscure: false),
                const SizedBox(height: 6),
                MainTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone Number is required";
                      } else {
                        return null;
                      }
                    },
                    controller: cubit.phoneController,
                    inputType: TextInputType.phone,
                    readOnly: false,
                    prefixIcon: Icons.phone,
                    context: context,
                    hintText: "Phone Number",
                    obscure: false),
                const SizedBox(height: 6),
                MainTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      } else {
                        return null;
                      }
                    },
                    controller: cubit.passwordController,
                    inputType: TextInputType.visiblePassword,
                    readOnly: false,
                    suffixIcon: GestureDetector(
                        onTap: () => cubit.changePasswordVisibility(),
                        child: Icon(
                          cubit.passSuffix,
                          color: Theme.of(context).textTheme.subtitle1!.color,
                        )),
                    prefixIcon: Icons.phone,
                    context: context,
                    hintText: "Password",
                    obscure: cubit.isHidden),
                const SizedBox(height: 10),
                BuildCondition(
                  condition: state is !UserRegisterLoadingState,
                  builder: (context){
                    return Center(
                        child: MainButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userRegister(
                                email: cubit.emailController.text,
                                name: cubit.nameController.text,
                                phone: cubit.phoneController.text,
                                password: cubit.passwordController.text,
                              );
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
