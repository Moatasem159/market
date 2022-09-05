import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:supermarket/features/profile/presentation/cubits/profile_state.dart';
import 'package:supermarket/features/profile/presentation/screens/update_user_data.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Account details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(BlocProvider.of<ProfileCubit>(context).user!=null)
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateUserDataScreen(
                          user: BlocProvider.of<ProfileCubit>(context).user!,
                          email: true,
                        ),
                      ));
                },
                child: ListTile(
                  title: const Text(
                    "Email:",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    BlocProvider.of<ProfileCubit>(context).user!.data!.email!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateUserDataScreen(
                          user:BlocProvider.of<ProfileCubit>(context).user!,
                          name: true,
                        ),
                      ));
                },
                child: ListTile(
                  title: const Text(
                    "Name:",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    BlocProvider.of<ProfileCubit>(context).user!.data!.name!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateUserDataScreen(
                          user:BlocProvider.of<ProfileCubit>(context).user!,
                          phoneNumber: true,
                        ),
                      ));
                },
                child: ListTile(
                  title: const Text(
                    "Phone number:",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    BlocProvider.of<ProfileCubit>(context).user!.data!.phone!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              const ListTile(
                title: Text(
                  "Password:",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                ),
                subtitle: Text(
                  "*************************",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ],
          ),
        ],
      ),
    ));
  },
);
  }
}
