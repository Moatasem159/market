import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:supermarket/config/routes/app_routes.dart';
import 'package:supermarket/core/utils/app_colors.dart';
import 'package:supermarket/core/widgets/buttons.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';
import 'package:supermarket/features/logout/presentation/cubits/logout_cubit.dart';
import 'package:supermarket/features/logout/presentation/cubits/logout_state.dart';
import 'package:supermarket/features/profile/presentation/screens/account_details_screen.dart';
import 'package:supermarket/injection_container.dart';


class ProfileDataWidget extends StatelessWidget {

  final UserModel model;
  const ProfileDataWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const SizedBox(height: 10,),
       Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Hi,${model.data!.name}",
            style: const TextStyle(fontSize: 28),
          ),
      ),
       Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${model.data!.phone}",
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const Divider(
          color: Colors.grey,
          height: 20,
          thickness: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Row(
            children:  [
              const Text("My points:",style: TextStyle(
                  fontSize: 20
              ),),
              const Spacer(),
              Text("${model.data!.points}"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Row(
            children: [
              const Text("My credits:",style: TextStyle(
                  fontSize: 20
              ),),
              const Spacer(),
              Text("${model.data!.credit}"),
            ],
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountDetailsScreen(),)),
          child: const Padding(
            padding:EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Text("Account settings"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
          ),
        ),
        const SizedBox(height: 150,),
         BlocProvider(create: (context) => sl<LogoutCubit>(),
          child: BlocConsumer<LogoutCubit,LogoutStates>(
            listener: (context, state) {

            },
          builder: (context, state) {
              if(state is LogoutLoadingState)
              {
                  return Center(
                    child: SpinKitPouringHourGlass(color: AppColors.primaryColor,strokeWidth: 3,
                    size: 30),
                  );
                }
            return Center(
              child: MainButton(onPressed: (){
                BlocProvider.of<LogoutCubit>(context).userLogout().then((value){
                  Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreenRoute, (route) => false);
                });
              }, label: "logout"),
            );
          },
        ),)
      ],
    );
  }
}
