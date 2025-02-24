import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/cubit/sport/get_top_sport_cubit.dart';

import '../../../ApiClient/api_client.dart';
import '../../../constant/app_color.dart';
import '../../../cubit/customer_details/user_selected_location_information_cubit.dart';
import '../../../cubit/sport/get_sport_cubit.dart';
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
  final ScrollController _rightListScrollController = ScrollController();
  String? _currentVisibleSport; // Holds the currently visible sport name
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _currentVisibleSport = context.read<UserSelectedLocationInformationCubit>().state.selectedSportId;
      setState(() {}); // Ensure the UI updates with the initial value
    });
    _rightListScrollController.addListener(_onScroll);
  }

  @override
  void dispose() {

    _rightListScrollController.removeListener(_onScroll);
    _rightListScrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final sportData =
        context.read<GetTopSportCubit>().getSportsResponseModelBySportId;

    if (sportData.data == null || sportData.data!.isEmpty) return;

    double scrollOffset = _rightListScrollController.offset;
    double itemHeight = 250 + 50; // Approximate item height including padding

    int index = (scrollOffset / itemHeight)
        .round()
        .clamp(0, sportData.data!.length - 1);
    String? newVisibleSport = sportData.data![index].newSportId;

    if (newVisibleSport != _currentVisibleSport) {
      setState(() {
        _currentVisibleSport = newVisibleSport;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF381004),
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
      body: SizedBox(
        width: double.infinity,
        child: Builder(builder: (context) {
          final sportData =
              context.watch<GetTopSportCubit>().getSportsResponseModelBySportId;
          if (sportData.data != null && sportData.data!.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 75,
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
                        child: Center(
                          // Ensures the list starts from the center
                          child: SingleChildScrollView(
                            child: Builder(
                              builder: (context) {
                                final sportsData =
                                    context.watch<GetSportCubit>();
                                if (sportsData.getSportsResponseModel.data !=
                                    null) {
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: NeverScrollableScrollPhysics(),
                                    // Prevent independent scrolling
                                    shrinkWrap: true,
                                    // Ensures it only takes necessary space
                                    itemCount: sportsData.getSportsResponseModel
                                            .data?.length ??
                                        0,
                                    itemBuilder: ((context, index) {
                                      final sport = sportsData
                                          .getSportsResponseModel.data?[index];
                                      bool isHighlighted = sport?.sportId ==
                                          _currentVisibleSport;
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8), // Adds spacing
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(3),
                                           color: isHighlighted ? AppColor.kPrimaryButtonColor.withOpacity(0.2): null
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: InkWell(
                                                onTap: () {
                                                  // context
                                                  //     .push(SportsPlaces.routeName);
                                                  int index = sportData.data!
                                                      .indexWhere((element) =>
                                                          element.newSportId ==
                                                          sport?.sportId);
                                                  if (index != -1) {
                                                    _rightListScrollController
                                                        .animateTo(
                                                      index * (250 + 50),
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.easeInOut,
                                                    );
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: ShapeDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.25),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side: const BorderSide(
                                                              width: 0.10,
                                                              color:
                                                                  Colors.white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7.80),
                                                        ),
                                                        shadows: const [
                                                          BoxShadow(
                                                            color:
                                                                Color(0x1E18274B),
                                                            blurRadius: 6.25,
                                                            offset:
                                                                Offset(0, 2.78),
                                                            spreadRadius: -2.08,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x3F000000),
                                                            blurRadius: 1.39,
                                                            offset:
                                                                Offset(0, 1.39),
                                                            spreadRadius: 0,
                                                          ),
                                                        ],
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                7.80),
                                                        child: CachedNetworkImage(
                                                          filterQuality:
                                                              FilterQuality.low,
                                                          fit: BoxFit.cover,
                                                          imageUrl:
                                                              "$baseUrl/${sport?.image ?? ''}",
                                                          placeholder: (context,
                                                                  url) =>
                                                              const Center(
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              const Center(
                                                                  child: Icon(Icons
                                                                      .error)),
                                                        ),
                                                      ),
                                                    ),

                                                    // Space between image and name
                                                    const SizedBox(height: 5),

                                                    // Text below the image, aligned properly
                                                    SizedBox(
                                                      width: 60,
                                                      // Adjust width as needed
                                                      child: Center(
                                                        child: CommonTextWidget(
                                                          text: sport?.name ?? '',
                                                          fontSize: 14,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),

                                                    const SizedBox(height: 10),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                }
                                return SizedBox();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
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
                          child: ListView.separated(
                            controller: _rightListScrollController,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: sportData.data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              final sport = sportData.data![index];
                              return InkWell(
                                onTap: () {
                                  context.push(IndividualSports.routeName,
                                      extra: sport);
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, left: 5),
                                      child: Container(
                                        width: double.infinity,
                                        height: 250,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                '$baseUrl/${sport.images?.first.image}'),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 20,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return SizedBox();
        }),
      ),
    );
  }
}
