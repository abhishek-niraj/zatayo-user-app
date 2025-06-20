import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/cubit/center/get_center_cubit.dart';
import 'package:zatayo/utils/app_shared_preference_helper.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../../cubit/center/select_center_cubit.dart';
import '../../../cubit/customer_details/user_selected_location_information_cubit.dart';
import '../../../cubit/fitness/fitness_cubit.dart';
import '../../../cubit/sport/get_sport_by_id_cubit.dart';
import '../../common_widget/common_text_field_widget.dart';

class PickAnAreaScreen extends StatefulWidget {
  static const String routeName = "/pick-an-area";

  const PickAnAreaScreen({super.key});

  @override
  State<PickAnAreaScreen> createState() => _PickAnAreaScreenState();
}

class _PickAnAreaScreenState extends State<PickAnAreaScreen> {
  @override
  void initState() {
    context.read<GetCenterCubit>().fetchCenters();
    super.initState();
  }
  void callAPi(String sportId, String centerName) {
    if (!mounted) return; // Ensure the widget is still mounted

    final bodyRequest = {
      "sportId":sportId ?? '',
      "city": centerName ?? ''
    };
    context.read<FitnessCubit>().fetchFitness(bodyRequest);
    context.read<GetSportByIdCubit>().fetchSportsBySportId(bodyRequest);
    // Perform API call logic here
    if (!kReleaseMode) {
      if (kDebugMode) {
        print("API called with sportId: $sportId, centerName: $centerName");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Make the gradient background cover the entire page
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF381004),
              Color(0xFFB7340B),
              Color(0xFF381004),
            ],
          ),
        ),
        // Use MediaQuery to ensure the container takes up the full height of the screen
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextWidget(
                        text: "Pick an area",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      CommonTextWidget(
                        text: "To find classes",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3FF97316).withOpacity(0.09),
                            blurRadius: 0,
                            offset: Offset(0, 0),
                            spreadRadius: 4,
                          )
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CommonTextFieldWidget(
                            hintText: "Search an area",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.search,
                                size: 25,
                              ),
                            ),
                            maxLength: 30,
                            keyboardType: TextInputType.text,
                            inputFormatters: const [],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CommonTextWidget(
                    text: "AREA",
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(width: 10),
                  CommonTextWidget(
                    text: "(No. of sports centers)",
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                  )
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Builder(builder: (context) {
                  final centers =
                      context.watch<GetCenterCubit>().getCenterResponseModel.data;

                  if (centers != null) {
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: centers.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(Icons.location_on_outlined),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 18,
                                ),
                                title: CommonTextWidget(
                                    text:
                                    "${centers[index].city}   (${centers[index].centersNumber})"),
                                onTap: () {
                                  final selectedCenter = context.read<SelectCenterCubit>();
                                  selectedCenter.selectCenter(
                                      centerName: centers[index].city
                                  );
                                  AppSharedPreferenceHelper().saveCustomerData(
                                      "centerName", centers[index].city ?? '');

                                  if (selectedCenter.state.centerName != null || selectedCenter.state.sportId != null) {
                                    callAPi(selectedCenter.state.sportId ?? '', centers[index].city ?? '');
                                  }
                                  context.read<UserSelectedLocationInformationCubit>().updateModel(
                                      cityName: centers[index].city ?? ''
                                  );
                                  // context.push(
                                  //   '/feed-page',
                                  // );
                                  context.pushReplacement('/feed-page');

                                  // Navigator.pop(context);
                                },
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.white70,
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox();
                      },
                    );
                  }
                  return SizedBox();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
