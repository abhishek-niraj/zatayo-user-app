import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../ApiClient/api_client.dart';
import 'common_text_widget.dart';

class CommonItem extends StatefulWidget {
  final List? image;
  final String? name;
  final String? location;

  const CommonItem({this.image, this.name, this.location, super.key});

  @override
  State<CommonItem> createState() => _CommonItemState();
}

class _CommonItemState extends State<CommonItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            width: double.infinity,
            height: 350,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child:  ClipRRect(
              borderRadius:
              BorderRadius.circular(
                  0),
              child:  CarouselSlider.builder(
                itemCount: widget.image?.length ?? 0,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                    CachedNetworkImage(
                      filterQuality: FilterQuality.low,
                      fit: BoxFit.cover,
                      imageUrl: '$baseUrl/${ widget.image?[itemIndex].image}',
                      placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                    ),
                options: CarouselOptions(

                  animateToClosest: true,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 1 / 2,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  enlargeFactor: 0.3,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      // currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(
                text: '${widget.name}',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CommonTextWidget(text: '4.5')
                ],
              ),
            ],
          ),
        ),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 30,
              ),
              CommonTextWidget(
                text: '${widget.location}',
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        )
      ],
    );
  }
}
