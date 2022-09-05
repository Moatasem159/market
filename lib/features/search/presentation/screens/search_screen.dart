import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:supermarket/core/utils/app_colors.dart';
import 'package:supermarket/features/search/presentation/cubits/search_cubit.dart';
import 'package:supermarket/features/search/presentation/cubits/search_state.dart';
import 'package:supermarket/features/search/presentation/widgets/search_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            FocusScope.of(context).unfocus();
            return BlocProvider.of<SearchCubit>(context).searchActive(context);
          },
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
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
                      onChanged: (value) {
                        BlocProvider.of<SearchCubit>(context).search(text: value);
                      },
                    ),
                  ),
                ),
                body: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  if (state is SearchLoadingState)
                    SpinKitDoubleBounce(
                      color: AppColors.primaryColor,
                      size: 45,
                    ),
                  if (state is !SearchLoadingState&&BlocProvider.of<SearchCubit>(context).searchModel?.data!.data !=null)
                    SearchGirdView(
                        products: BlocProvider.of<SearchCubit>(context)
                            .searchModel
                            ?.data!
                            .data),
                  if (state is !SearchLoadingState&&BlocProvider.of<SearchCubit>(context).searchModel?.data!.data !=
                      null &&
                      BlocProvider.of<SearchCubit>(context)
                          .searchModel!
                          .data!
                          .data!
                          .isEmpty)
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.search,
                            size: 100,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'No  Items',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    )
                ],
              ),),
            ),
          ),
        );
      },
    );
  }
}
