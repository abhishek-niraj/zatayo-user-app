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
  Timer? _debounce;
  String? _lastSportId;
  String? _lastCenterName;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedCenter = context.read<SelectCenterCubit>().state;

      // if (_shouldCallApi(selectedCenter.sportId, selectedCenter.centerName)) {
      //   callAPi(selectedCenter.sportId!, selectedCenter.centerName!);
      // }

      _subscription = context.read<SelectCenterCubit>().stream.listen((data) {
        if (mounted) {
          _debounce?.cancel(); // Cancel previous debounce timer

          _debounce = Timer(const Duration(milliseconds: 500), () {
            if (_shouldCallApi(data.sportId, data.centerName)) {
              callAPi(data.sportId!, data.centerName!);
            }
          });
        }
      });
    });
  }

  bool _shouldCallApi(String? sportId, String? centerName) {
    if (sportId == null || centerName == null) return false;
    if (sportId == _lastSportId && centerName == _lastCenterName) return false;

    _lastSportId = sportId;
    _lastCenterName = centerName;
    return true;
  }

  void callAPi(String sportId, String centerName) {
    if (!mounted) return;

    final bodyRequest = {
      "sportId": sportId,
      "city": centerName
    };

    context.read<GetSportByIdCubit>().fetchSportsBySportId(bodyRequest);

    if (kDebugMode) {
      print("API called with sportId: $sportId, centerName: $centerName");
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _debounce?.cancel(); // Cancel debounce timer
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
