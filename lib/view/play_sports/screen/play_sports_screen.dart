import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../ApiClient/api_client.dart';
import '../../../cubit/customer_details/user_selected_location_information_cubit.dart';
import '../../../cubit/sport/get_sport_cubit.dart';
import '../../common_widget/common_app_bar_widget.dart';
import '../../common_widget/common_text_widget.dart';
import '../../sports_places/screen/sports_places.dart';

class PlaySportsScreen extends StatefulWidget {
  static const routeName = "/play-sports";

  const PlaySportsScreen({super.key});

  @override
  State<PlaySportsScreen> createState() => _PlaySportsScreenState();
}

class _PlaySportsScreenState extends State<PlaySportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonAppBarWidget(
          title: "Play Sports",
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
            final sportsData = context.watch<GetSportCubit>();
            if (sportsData.getSportsResponseModel.data != null) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: sportsData.getSportsResponseModel.data?.length ?? 0,
                itemBuilder: ((context, index) {
                  final sport = sportsData.getSportsResponseModel.data?[index];
                  return InkWell(
                    onTap: () {
                      context
                          .read<UserSelectedLocationInformationCubit>()
                          .updateModel(selectedSportId: sport?.sportId ?? '');

                      context.push(SportsPlaces.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 450,
                                decoration: ShapeDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.10, color: Colors.white),
                                    borderRadius: BorderRadius.circular(7.80),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x1E18274B),
                                      blurRadius: 6.25,
                                      offset: Offset(0, 2.78),
                                      spreadRadius: -2.08,
                                    ),
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 1.39,
                                      offset: Offset(0, 1.39),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.80),
                                  child: CachedNetworkImage(
                                    filterQuality: FilterQuality.low,
                                    fit: BoxFit.cover,
                                    imageUrl: "$baseUrl/${sport?.image ?? ''}",
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Center(child: Icon(Icons.error)),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 300,
                                child: Column(
                                  children: [
                                    Center(
                                      child: CommonTextWidget(
                                        text: "${sport?.name?.toUpperCase()}",
                                        fontSize: 30,
                                      ),
                                    ),
                                    const CommonTextWidget(
                                      text: "Playing",
                                      fontSize: 20,
                                    ),
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 15, sigmaY: 15),
                                        child: Container(
                                          width: 100,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: const Center(
                                              child: CommonTextWidget(
                                            text: "Explore",
                                            fontSize: 20,
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  );
                }),
              );
            }
            return SizedBox();
          }),
        ),
      ),
    );
  }
}
