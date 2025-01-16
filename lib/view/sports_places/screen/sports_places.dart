import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/cubit/sport/get_top_sport_cubit.dart';

import '../../../ApiClient/api_client.dart';
import '../../../constant/app_color.dart';
import '../../common_widget/common_app_bar_widget.dart';
import '../../common_widget/common_item.dart';
import '../../common_widget/common_text_widget.dart';
import '../../individual_sports_gym/screen/individual_sports.dart';
class SportsPlaces extends StatefulWidget {
  static const String routeName = "/sport-places";
  const SportsPlaces({super.key});

  @override
  State<SportsPlaces> createState() => _SportsPlacesState();
}

class _SportsPlacesState extends State<SportsPlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonAppBarWidget(
          title: "Top Sport Places",
        ),
        elevation: 100,
        flexibleSpace: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Colors.transparent,
                Color(0xFF381004),
              ],
            ),
          ),

        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF381004),
                Color(0xFFB7340B),
              ],
            ),
          ),
          child: Builder(builder: (context) {
            final sportData =
                context.watch<GetTopSportCubit>().getSportsResponseModelBySportId;
            if (sportData.data != null && sportData.data!.isNotEmpty) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CommonTextWidget(
                            text: "Top Sports Center",
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        CommonTextWidget(
                          text: "See All",
                          color: AppColor.kSecondaryButtonColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: sportData.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final sport = sportData.data![index];
                      return InkWell(
                        onTap: () {
                          context.push(IndividualSports.routeName,
                              extra:  sport
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: double.infinity,
                                height: 250,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        '$baseUrl/${sport.images?.first.image}'
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CommonTextWidget(
                                      text: sport.sportName ?? '',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
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
                                  Expanded(
                                    child: CommonTextWidget(
                                      text: sport.locationName ?? '',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                  )
                ],
              );
            }
            return SizedBox();
          }),
        ),
      ),
    );
  }
}
