import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supermarket/core/utils/app_colors.dart';
import 'package:supermarket/core/widgets/buttons.dart';
import 'package:supermarket/core/widgets/textformfield.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';
import 'package:supermarket/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:supermarket/features/profile/presentation/cubits/profile_state.dart';

class UpdateUserDataScreen extends StatelessWidget {
  final bool email;
  final bool name;
  final bool phoneNumber;
  final UserModel user;

  const UpdateUserDataScreen(
      {Key? key,
      this.email = false,
      this.name = false,
      this.phoneNumber = false,
      required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController controller=TextEditingController();
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {

        if(state is UpdateUserDataSuccessState)
          {
            Fluttertoast.showToast(
                msg: state.userModel.message!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.orange,
                textColor: Colors.black,
                fontSize: 16.0);
          }
        if(state is UpdateUserDataErrorState)
        {
          Fluttertoast.showToast(
              msg: state.msg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.orange,
              textColor: Colors.black,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
              child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MainBackButton(),
                ),
                const SizedBox(height: 200,),
                if (email)
                  Column(
                    children: [
                      MainTextFormField(
                          readOnly: false,
                          controller: controller,
                          context: context,
                          hintText: "Enter New Email",
                          obscure: false),
                      const SizedBox(
                        height: 15,
                      ),
                      if (state is! UpdateUserDataLoadingState)
                        MainButton(onPressed: () {
                          BlocProvider.of<ProfileCubit>(context).updateUserData(
                              name: user.data!.name!,
                              email: controller.text,
                              phone: user.data!.phone!).then((value) {
                                Navigator.pop(context);
                          });
                        }, label: "update"),
                      if (state is UpdateUserDataLoadingState)
                        SpinKitDoubleBounce(
                          color: AppColors.primaryColor,
                        )
                    ],
                  ),
                if (name)
                  Column(
                    children: [
                      MainTextFormField(
                          readOnly: false,
                          controller: controller,
                          context: context,
                          hintText: "Enter New name",
                          obscure: false),
                      const SizedBox(
                        height: 15,
                      ),
                      if (state is! UpdateUserDataLoadingState)
                        MainButton(onPressed: () {
                          BlocProvider.of<ProfileCubit>(context).updateUserData(
                              name: controller.text,
                              email: user.data!.email!,
                              phone: user.data!.phone!).then((value) {
                            Navigator.pop(context);
                          });
                        }, label: "update"),
                      if (state is UpdateUserDataLoadingState)
                        SpinKitDoubleBounce(
                          color: AppColors.primaryColor,
                        )
                    ],
                  ),
                if (phoneNumber)
                  Column(
                    children: [
                      MainTextFormField(
                          readOnly: false,
                          context: context,
                          controller: controller,
                          hintText: "Enter New Phone number",
                          obscure: false),
                      const SizedBox(
                        height: 15,
                      ),
                      if (state is! UpdateUserDataLoadingState)
                        MainButton(onPressed: () {
                          BlocProvider.of<ProfileCubit>(context).updateUserData(
                              name: user.data!.name!,
                              email: user.data!.email!,
                              phone: controller.text).then((value) {
                            Navigator.pop(context);
                          });
                        }, label: "update"),
                      if (state is UpdateUserDataLoadingState)
                        SpinKitDoubleBounce(
                          color: AppColors.primaryColor,
                        )
                    ],
                  ),
              ],
            ),
          )),
        );
      },
    );
  }
}
