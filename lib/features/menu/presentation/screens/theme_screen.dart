import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/config/themes/cubit/theme_cubit.dart';
import 'package:supermarket/config/themes/cubit/theme_state.dart';
import 'package:supermarket/core/widgets/buttons.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit,ThemesStates>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: MainBackButton(),
                    )
                ),
               SizedBox(height: MediaQuery.of(context).size.height/3,),
                MainButton(
                    onPressed: (){
                      BlocProvider.of<ThemeCubit>(context).changeThemeMode();
                    },
                    label: BlocProvider.of<ThemeCubit>(context).dark?"Light Theme":"Dark Theme"),
              ],
            )
          ));
    },);
  }
}
