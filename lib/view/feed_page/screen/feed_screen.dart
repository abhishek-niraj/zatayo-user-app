
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/cubit/customer_details/customer_details_cubit.dart';
import 'package:zatayo/cubit/sport/get_sport_cubit.dart';
import 'package:zatayo/cubit/sport/get_top_sport_cubit.dart';
import 'package:zatayo/view/Profile/screen/profile_screen.dart';

import '../../../cubit/sport/get_sport_by_id_cubit.dart';
import '../../Scanner/screen/scanner_screen.dart';
import '../../fitness/screen/fitness_screen.dart';
import '../../home/screen/home_page.dart';
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
  }

  @override
  void initState() {
    // TODO: implement
    Future.microtask(() {
      apiCall();
      // Code to execute
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        height: 70,
        backgroundColor: const Color(0xFF1E1E1E),
        activeColor: AppColor.kPrimaryButtonColor,
        items: const [
          TabItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: 'Home',
            activeIcon: Icon(
              Icons.home,
              size: 30,
              color: AppColor.kPrimaryButtonColor,
            ),
          ),
          TabItem(icon: Icon(Icons.search), title: 'Fitness'),
          TabItem(
            icon: Icon(Icons.qr_code_scanner_rounded, size: 30),
            activeIcon: Icon(
              Icons.qr_code_scanner_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
          TabItem(icon: Icon(Icons.notifications), title: 'Sports'),
          TabItem(icon: Icon(Icons.account_circle), title: 'Profile'),
        ],
        initialActiveIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
          // Animate to the selected page
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
          ProfileScreen()
        ],
      ),
    );
  }
}
