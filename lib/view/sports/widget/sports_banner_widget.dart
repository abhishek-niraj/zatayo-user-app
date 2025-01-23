import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../../../constant/app_color.dart';
import '../../../cubit/center/select_center_cubit.dart';
import '../../../cubit/sport/get_sport_by_id_cubit.dart';
import '../../../cubit/sport/get_sport_cubit.dart';
import '../../../cubit/sport/get_sports_state.dart';

class SportsBannerWidget extends StatefulWidget {
  const SportsBannerWidget({super.key});

  @override
  State<SportsBannerWidget> createState() => _SportsBannerWidgetState();
}

class _SportsBannerWidgetState extends State<SportsBannerWidget> {
  int? selectedIndex;
  StreamSubscription? _subscription;

  void apiCall(id, index) {
    Future.microtask(() {
      selectedSport(id, index);
    });
  }

  void selectedSport(id, index) {
    final selectedCenter = context.read<SelectCenterCubit>();
    selectedCenter.selectCenter(sportId: id);

    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    final selectedCenter = context.read<SelectCenterCubit>().state;
    if (selectedCenter.centerName != null || selectedCenter.sportId != null) {
      callAPi(selectedCenter.sportId ?? '', selectedCenter.centerName ?? '');
    }
    _subscription = context.read<SelectCenterCubit>().stream.listen((data) {

      if (mounted) {
        callAPi(data.sportId ?? '', data.centerName ?? '');
      }
    });

    super.initState();
  }

  void callAPi(String sportId, String centerName) {
    if (!mounted) return; // Ensure the widget is still mounted
    final bodyRequest = {
      "sportId":sportId ?? '',
      "city": centerName ?? ''
    };
    context.read<GetSportByIdCubit>().fetchSportsBySportId(bodyRequest);
    // Perform API call logic here
    if (!kReleaseMode) {
      if (kDebugMode) {
        print("API called with sportId: $sportId, centerName: $centerName");
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSportCubit, GetSportsState>(
      builder: (BuildContext context, state) {
        if (state is GetSportSuccess) {
          final sports = state.getSportsResponseModel.data;
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Wrap(
              runSpacing: 20,
              spacing: 15,
              children: [
                for (int i = 0; i < sports!.length; i++)
                  InkWell(
                    onTap: () {
                      apiCall(sports[i].sportId, i);
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: AppColor.kSecondaryGradientColor,
                        boxShadow: [
                          BoxShadow(
                            color:
                                AppColor.kSecondaryButtonColor.withOpacity(0.9),
                            // Shadow color with transparency
                            spreadRadius: 2,
                            // How much the shadow spreads
                            blurRadius:
                                selectedIndex != null && selectedIndex == i
                                    ? 15
                                    : 5,
                            // How soft the shadow looks
                            offset:
                                Offset(2, 3), // X and Y offset of the shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: CommonTextWidget(
                          text: sports[i].name ?? '',
                          color: selectedIndex != null && selectedIndex == i
                              ? Colors.white
                              : AppColor.kSecondaryButtonColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
