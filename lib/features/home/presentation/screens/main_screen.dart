import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/config/routes/app_routes.dart';
import 'package:supermarket/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:supermarket/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_states.dart';
import 'package:supermarket/features/home/presentation/widgets/app_bar_logo.dart';
import 'package:supermarket/features/search/presentation/cubits/search_cubit.dart';
import 'package:supermarket/features/search/presentation/cubits/search_state.dart';
import 'package:supermarket/injection_container.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<BottomNavCubit>()),

      ],
      child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocConsumer<SearchCubit, SearchStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return BlocConsumer<BottomNavCubit, BottomNavStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(
                        leading: const AppBarLogoWidget(),
                        leadingWidth: 170,
                        titleSpacing: 0,
                        title: SizedBox(
                          width: 235,
                          child: TextFormField(
                            cursorColor: Theme.of(context).primaryColorLight,
                            decoration: InputDecoration(
                              hintText: "Search",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorLight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorLight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                            onTap: () {
                              FocusScope.of(context).unfocus();
                             Navigator.pushNamed(context, Routes.searchScreenRoute);
                            },
                          ),
                        ),
                      ),
                      body: BlocProvider.of<BottomNavCubit>(context).screens[
                      BlocProvider.of<BottomNavCubit>(context)
                          .bottomNavIndex],
                      bottomNavigationBar:BottomNavigationBar(
                        items: BlocProvider.of<BottomNavCubit>(context)
                            .navigationItems,
                        currentIndex: BlocProvider.of<BottomNavCubit>(context)
                            .bottomNavIndex,
                        onTap: (value) {
                          BlocProvider.of<BottomNavCubit>(context)
                              .changeIndex(value, context);
                        },
                      ),
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
