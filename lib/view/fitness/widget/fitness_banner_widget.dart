import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/cubit/fitness_banner/fitness_banner_cubit.dart';
import 'package:zatayo/cubit/fitness_banner/fitness_banner_state.dart';

import '../../../ApiClient/api_client.dart';
class FitnessBannerWidget extends StatefulWidget {
  const FitnessBannerWidget({super.key});

  @override
  State<FitnessBannerWidget> createState() => _FitnessBannerWidgetState();
}

class _FitnessBannerWidgetState extends State<FitnessBannerWidget> {
  @override
  void initState() {
    final bodyRequest = {"bannerId": "", "bannerName": "Fitness"};
    context.read<FitnessBannerCubit>().fetchFitnessBanners(bodyRequest);
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FitnessBannerCubit, FitnessBannerState>(
      builder: (BuildContext context, state) {
        if (state is FitnessBannerSuccess) {
          final bannerData = state.fitnessBannerResponseModel.data;
          return Stack(
            children: [
              CarouselSlider.builder(
                itemCount: bannerData.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                    CachedNetworkImage(
                      filterQuality: FilterQuality.low,
                      fit: BoxFit.cover,
                      imageUrl: '$baseUrl/${bannerData[itemIndex].image}',
                      placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                    ),
                options: CarouselOptions(
                  height: 350.0,
                  animateToClosest: true,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 1 / 2,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  enlargeFactor: 0.3,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    // Adjust the padding as needed
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < bannerData.length; i++)
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                height: 10, // Adjust the height
                                width: 10, // Adjust the width
                                decoration: BoxDecoration(
                                  color: i == currentIndex
                                      ? Colors.white
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(
                                      20), // Make it circular
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ))
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
