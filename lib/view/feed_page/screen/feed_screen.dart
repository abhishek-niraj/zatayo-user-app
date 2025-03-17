import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/cubit/customer_details/customer_details_cubit.dart';
import 'package:zatayo/cubit/sport/get_sport_cubit.dart';
import 'package:zatayo/cubit/sport/get_top_sport_cubit.dart';
import 'package:zatayo/view/Profile/screen/profile_screen.dart';

import '../../../cubit/center/select_center_cubit.dart';
import '../../../cubit/deal_of_day/get_deal_of_day_cubit.dart';
import '../../../cubit/sport/get_sport_by_id_cubit.dart';
import '../../../utils/app_shared_preference_helper.dart';
import '../../Scanner/screen/scanner_screen.dart';
import '../../app_drawer/custom_app_drawer.dart';
import '../../fitness/screen/fitness_screen.dart';
import '../../home/screen/home_page.dart';
import '../../pick_an_area/screen/pick_an_area_screen.dart';
import '../../sports/screen/sports_screen.dart';

class HomeV2 extends StatefulWidget {
  const HomeV2({super.key});

  @override
  State<HomeV2> createState() => _HomeV2State();
}

class _HomeV2State extends State<HomeV2> {
  int _selectedPageIndex = 0;

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  void apiCall() {
    context.read<CustomerDetailsCubit>().fetchCustomerDetails();
    context.read<GetSportCubit>().fetchSports();
    context.read<GetTopSportCubit>().fetchTopSports();
    getDataFromSharedPreference();
    context.read<GetDealOfDayCubit>().fetchDealOfDay();

  }

  getDataFromSharedPreference() async {
    final centerName =
        await AppSharedPreferenceHelper().getCustomerData("centerName");

    if (mounted) {
      context.read<SelectCenterCubit>().selectCenter(centerName: centerName);
    }
  }

  @override
  void initState() {
    // TODO: implement
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedPageIndex != 0) {
          setState(() {
            _selectedPageIndex = 0;
          });
          _pageController.jumpToPage(0);
          return false; // Prevents exiting the app
        }
        return true; // Allows exiting the app if already on HomePage
      },
      child: Scaffold(
        bottomNavigationBar: ConvexAppBar(
          key: ValueKey(_selectedPageIndex), // Forces rebuild when index changes
          style: TabStyle.fixedCircle,
          height: 70,
          backgroundColor: const Color(0xFF1E1E1E),
          activeColor: AppColor.kPrimaryButtonColor,
          items: const [
            TabItem(
              icon: Icon(Icons.home, size: 30),
              title: 'Home',
              activeIcon: Icon(Icons.home, size: 30, color: AppColor.kPrimaryButtonColor),
            ),
            TabItem(icon: Icon(Icons.fitness_center), title: 'Fitness'),
            TabItem(icon: Icon(Icons.qr_code_scanner_rounded, size: 30),
              activeIcon: Icon(Icons.qr_code_scanner_rounded, size: 30, color: Colors.white),
            ),
            TabItem(icon: Icon(Icons.sports_gymnastics), title: 'Sports'),
            TabItem(icon: Icon(Icons.search), title: 'Search'),
          ],
          initialActiveIndex: _selectedPageIndex, // Ensure correct tab selection
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 1),
              curve: Curves.easeInOut,
            );
          },
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          children: const [
            HomePage(),
            FitnessScreen(),
            ScannerScreen(),
            SportsScreen(),
            PickAnAreaScreen()
          ],
        ),
        drawer: CustomAppDrawer()
      ),
    );
  }


}

// context.push(PickAnAreaScreen.routeName);