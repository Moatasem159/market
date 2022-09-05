import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImagesSlider extends StatelessWidget {

  final List<String> ?images;
  const ProductImagesSlider({Key? key,required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount:images!.length,
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            height: 250,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),

            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            onPageChanged: (index, reason) {

            },
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,),
          carouselController:CarouselController(),
          itemBuilder:(context, index, realIndex) {
            return CachedNetworkImage(
              imageUrl:images![index],
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
  }
}
