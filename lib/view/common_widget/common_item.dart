import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../ApiClient/api_client.dart';
import 'common_text_widget.dart';

class CommonItem extends StatefulWidget {
  final String? image;
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
              child: CachedNetworkImage(
                imageUrl: "$baseUrl/${widget.image ?? ''}",
                fit: BoxFit.cover,
                placeholder: (context,
                    url) =>
                const Center(
                    child:
                    CircularProgressIndicator(
                      strokeWidth: 1,
                    )),
                errorWidget: (context,
                    url, error) =>
                const Icon(
                    Icons.error),
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
