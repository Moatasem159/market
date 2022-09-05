import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/core/widgets/buttons.dart';
import 'package:supermarket/core/widgets/network_error_widget.dart';
import 'package:supermarket/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:supermarket/features/profile/presentation/cubits/profile_state.dart';
import 'package:supermarket/features/profile/presentation/widgets/profile_data_loading_widget.dart';
import 'package:supermarket/features/profile/presentation/widgets/profile_data_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if (state is GetProfileSuccessState) {}
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15,top: 15),
                child: MainBackButton(),
              ),
              if (state is GetProfileSuccessState)
              ProfileDataWidget(model: BlocProvider.of<ProfileCubit>(context).user!),
              if(state is GetProfileLoadingState)
               const ProfileDataLoadingWidget(),
              if(state is GetProfileErrorState||BlocProvider.of<ProfileCubit>(context).user==null)
               NetworkErrorWidget(onRetryPressed: BlocProvider.of<ProfileCubit>(context).getProfile ),
            ],
          );
        },
      ),
    ));
  }
}
