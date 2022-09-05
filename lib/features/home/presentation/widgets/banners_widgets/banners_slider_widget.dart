import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:supermarket/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:supermarket/features/home/presentation/widgets/banners_widgets/banners_loading_widget.dart';


class BannersSlider extends StatefulWidget {
  const BannersSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<BannersSlider> createState() => _BannersSliderState();
}

class _BannersSliderState extends State<BannersSlider> {
  @override
  Widget build(BuildContext context) {
      return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (BlocProvider.of<HomeCubit>(context).homeModel?.data?.banners !=
            null) {
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: BlocProvider.of<HomeCubit>(context)
                    .homeModel!
                    .data!
                    .banners!
                    .length,
                    options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    height: 200,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration: const Duration(milliseconds: 500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,),
                    carouselController:CarouselController(),
                   itemBuilder:(context, index, realIndex) {
                  return CachedNetworkImage(
                    imageUrl:  BlocProvider.of<HomeCubit>(context)
                        .homeModel!
                        .data!
                        .banners![index].image!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (context, url) {
                      return const Image(
                        image:
                        AssetImage("assets/images/loading_image.jpg"),
                      );
                    },
                  );
                },
              ),
            ],
          );
        } else if (BlocProvider.of<HomeCubit>(context)
                    .homeModel
                    ?.data
                    ?.banners ==
                null ||
            state is GetHomeLoadingState) {
          return const BannersLoadingWidget();
        }
        return const BannersLoadingWidget();
      },
    );
  }
}
