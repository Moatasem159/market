import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/core/widgets/network_error_widget.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_cubit.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_states.dart';
import 'package:supermarket/features/favourite/presentation/widgets/favourites_grid_view.dart';
import 'package:supermarket/features/favourite/presentation/widgets/favourites_list_empty_widget.dart';
import 'package:supermarket/features/favourite/presentation/widgets/favourites_loading_grid_view.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouritesCubit,FavouriteStates>(
        listener: (context, state) {
          if (state is AddOrRemoveFavouriteSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.favoritesModel.message!),duration: const Duration(milliseconds: 750),));
          }
        },
      builder: (context, state) {
        return Column(
          children:  [
            const SizedBox(height: 10,),
            if (state is GetUserFavouritesLoadingState&&BlocProvider.of<FavouritesCubit>(context).favoritesModel?.favoritesDataModel?.data! ==null)
            const FavouritesLoadingGridView(),
            if (BlocProvider.of<FavouritesCubit>(context).favoritesModel?.favoritesDataModel?.data! != null&&BlocProvider.of<FavouritesCubit>(context).favoritesModel!.favoritesDataModel!.data!.isNotEmpty)
             FavouritesGridView(favoriteProducts: BlocProvider.of<FavouritesCubit>(context).favoritesModel!.favoritesDataModel?.data!,),
            if (BlocProvider.of<FavouritesCubit>(context).favoritesModel?.favoritesDataModel?.data!=null&&BlocProvider.of<FavouritesCubit>(context).favoritesModel!.favoritesDataModel!.data!.isEmpty)
            const FavouriteListEmpty(),
            if (state is GetUserFavouritesErrorState&&BlocProvider.of<FavouritesCubit>(context).favoritesModel?.favoritesDataModel?.data==null)
            NetworkErrorWidget(onRetryPressed:  BlocProvider.of<FavouritesCubit>(context).getUserFavourites),
          ],
        );
      },
    );
  }
}
