import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/cubit/customer_details/customer_details_cubit.dart';
import 'package:zatayo/view/Profile/screen/profile_screen.dart';

import '../../Scanner/screen/scanner_screen.dart';
import '../../common_widget/common_text_widget.dart';
import '../../fitness/screen/fitness_screen.dart';
import '../../home/screen/home_page.dart';
import '../../home_work_out/screen/home_work_out.dart';
import '../../individual_sports_gym/screen/individual_gym.dart';
import '../../individual_sports_gym/screen/individual_sports.dart';
import '../../notification/screen/notification_screen.dart';
import '../../sports/screen/sports_screen.dart';
import '../../sports_places/screen/sports_places.dart';
import '../../subscriptionplan/subscription_plan.dart';

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
   @override
  void initState() {
    // TODO: implement
     context.read<CustomerDetailsCubit>().fetchCustomerDetails();

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
//
// // Example Pages
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 44,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Good Morning ',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF818898),
//                         fontSize: 14,
//                         fontFamily: 'Plus Jakarta Sans',
//                         fontWeight: FontWeight.w400,
//                         letterSpacing: -0.28,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       'Hi, Abhishek Niraj !',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFFD3D1D8),
//                         fontSize: 18,
//                         fontFamily: 'Plus Jakarta Sans',
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//                 InkWell(
//                   onTap: () {
//                     context.push(NotificationScreen.routeName);
//                   },
//                   child: Container(
//                     width: 48,
//                     height: 48,
//                     clipBehavior: Clip.antiAlias,
//                     decoration: ShapeDecoration(
//                       shape: RoundedRectangleBorder(
//                         side: const BorderSide(
//                             width: 1, color: Color(0xFFDFE1E7)),
//                         borderRadius: BorderRadius.circular(48),
//                       ),
//                     ),
//                     child: Stack(
//                       children: [
//                         const Positioned(
//                           left: 0,
//                           right: 0,
//                           top: 0,
//                           bottom: 0,
//                           child: Icon(
//                             Icons.notifications_none_outlined,
//                             size: 27,
//                             color: Color(0xFFF5F5F5),
//                           ),
//                         ),
//                         Positioned(
//                           left: 25,
//                           top: 15,
//                           child: Container(
//                             width: 6,
//                             height: 6,
//                             decoration: const ShapeDecoration(
//                               color: Color(0xFFDF1C41),
//                               shape: OvalBorder(),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 11,
//           ),
//           Container(
//             child: Image.asset(
//               "assets/images/offer_image.png",
//               fit: BoxFit.cover,
//               width: double.infinity,
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomLeft,
//                 colors: [
//                   Color(0xFF381004),
//                   Color(0xFFB7340B),
//                 ],
//               ),
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Wrap(
//                     alignment: WrapAlignment.spaceBetween,
//                     spacing: 20, // Horizontal space between items
//                     runSpacing: 20, // Vertical space between rows
//                     children: [
//                       // Near by gyms
//                       InkWell(
//                         onTap: () {
//                           context.push("/near-by-gyms");
//                         },
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               "assets/images/near_by_gym.png",
//                               width: 60, // Adjust size as needed
//                               height: 60,
//                             ),
//                             const SizedBox(height: 8),
//                             const CommonTextWidget(text: "Near by gyms"),
//                           ],
//                         ),
//                       ),
//                       // Play Sports
//                       InkWell(
//                         onTap: () {
//                           context.push("/sport-places");
//                         },
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               "assets/images/play_sports.png",
//                               width: 60,
//                               height: 60,
//                             ),
//                             const SizedBox(height: 8),
//                             const CommonTextWidget(text: "Play Sports"),
//                           ],
//                         ),
//                       ),
//                       // Home workout
//                       InkWell(
//                         onTap: () {
//                           context.push(HomeWorkOut.routeName);
//                         },
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               "assets/images/home_wor_out.png",
//                               width: 60,
//                               height: 60,
//                             ),
//                             const SizedBox(height: 8),
//                             const CommonTextWidget(text: "Home workout"),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 const Row(
//                   children: [
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       "Deal of the day",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         context.push(SubscriptionPlan.routeName);
//                       },
//                       child: SizedBox(
//                         width: 100,
//                         height: 150,
//                         child: Column(
//                           children: [
//                             Container(
//                               width: 100,
//                               height: 82,
//                               clipBehavior: Clip.antiAlias,
//                               decoration: const BoxDecoration(),
//                               child: SizedBox(
//                                 width: 100,
//                                 height: 100,
//                                 child: Stack(
//                                   children: [
//                                     Positioned(
//                                       left: 0,
//                                       top: 0,
//                                       child: Container(
//                                         width: 100,
//                                         height: 100,
//                                         decoration: const ShapeDecoration(
//                                           shape: OvalBorder(
//                                             side: BorderSide(
//                                               width: 1.30,
//                                             ),
//                                           ),
//                                           gradient: LinearGradient(
//                                             colors: [
//                                               Colors.white,
//                                               Colors.white,
//                                               Colors.white,
//                                             ],
//                                             stops: [0.0, 0.5, 1.0],
//                                             // Define positions for each color in the gradient
//                                             begin: Alignment.topCenter,
//                                             end: Alignment.bottomCenter,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       left: 4,
//                                       top: 4,
//                                       width: 92,
//                                       height: 92,
//                                       child: Container(
//                                         decoration: const ShapeDecoration(
//                                           color: Color(0xFF381004),
//                                           shape: OvalBorder(),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(2.0),
//                                           child: Container(
//                                             width: 92,
//                                             height: 92,
//                                             decoration: const ShapeDecoration(
//                                               image: DecorationImage(
//                                                 image: AssetImage(
//                                                     "assets/images/plan.png"),
//                                                 fit: BoxFit.fill,
//                                               ),
//                                               shape: OvalBorder(),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             const Column(
//                               children: [
//                                 Text(
//                                   'DIAMOND',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Color(0xFFF5CF60),
//                                     fontSize: 13,
//                                     fontFamily: 'Work Sans',
//                                     fontWeight: FontWeight.w800,
//                                     height: 0.08,
//                                     letterSpacing: -0.04,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 CommonTextWidget(
//                                   text: "Get extra",
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   letterSpacing: -0.3,
//                                 ),
//                                 CommonTextWidget(
//                                   text: "150 off",
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   letterSpacing: -0.3,
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         context.push(SubscriptionPlan.routeName);
//                       },
//                       child: SizedBox(
//                         width: 100,
//                         height: 150,
//                         child: Column(
//                           children: [
//                             Container(
//                               width: 100,
//                               height: 82,
//                               clipBehavior: Clip.antiAlias,
//                               decoration: const BoxDecoration(),
//                               child: SizedBox(
//                                 width: 100,
//                                 height: 100,
//                                 child: Stack(
//                                   children: [
//                                     Positioned(
//                                       left: 0,
//                                       top: 0,
//                                       width: 100,
//                                       height: 100,
//                                       child: Container(
//                                         width: 100,
//                                         height: 100,
//                                         decoration: const ShapeDecoration(
//                                           shape: OvalBorder(
//                                             side: BorderSide(
//                                               width: 1.30,
//                                             ),
//                                           ),
//                                           gradient: LinearGradient(
//                                             colors: [
//                                               Color(0xFFF5CF60),
//                                               Colors.white,
//                                               Colors.white,
//                                             ],
//                                             stops: [0.0, 0.5, 1.0],
//                                             // Define positions for each color in the gradient
//                                             begin: Alignment.topCenter,
//                                             end: Alignment.bottomCenter,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       left: 4,
//                                       top: 4,
//                                       width: 92,
//                                       height: 92,
//                                       child: Container(
//                                         decoration: const ShapeDecoration(
//                                           color: Color(0xFF381004),
//                                           shape: OvalBorder(),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(2.0),
//                                           child: Container(
//                                             width: 92,
//                                             height: 92,
//                                             decoration: const ShapeDecoration(
//                                               image: DecorationImage(
//                                                 image: AssetImage(
//                                                     "assets/images/plan.png"),
//                                                 fit: BoxFit.fill,
//                                               ),
//                                               shape: OvalBorder(),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             const Column(
//                               children: [
//                                 Text(
//                                   'GOLD',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Color(0xFFF5CF60),
//                                     fontSize: 13,
//                                     fontFamily: 'Work Sans',
//                                     fontWeight: FontWeight.w800,
//                                     height: 0.08,
//                                     letterSpacing: -0.04,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 CommonTextWidget(
//                                   text: "Get extra",
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   letterSpacing: -0.3,
//                                 ),
//                                 CommonTextWidget(
//                                   text: "150 off",
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   letterSpacing: -0.3,
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         context.push(SubscriptionPlan.routeName);
//                       },
//                       child: SizedBox(
//                         width: 100,
//                         height: 150,
//                         child: Column(
//                           children: [
//                             Container(
//                               width: 100,
//                               height: 82,
//                               clipBehavior: Clip.antiAlias,
//                               decoration: const BoxDecoration(),
//                               child: SizedBox(
//                                 width: 100,
//                                 height: 100,
//                                 child: Stack(
//                                   children: [
//                                     Positioned(
//                                       left: 0,
//                                       top: 0,
//                                       child: Container(
//                                         width: 100,
//                                         height: 100,
//                                         decoration: const ShapeDecoration(
//                                           shape: OvalBorder(
//                                             side: BorderSide(
//                                               width: 1.30,
//                                             ),
//                                           ),
//                                           gradient: LinearGradient(
//                                             colors: [
//                                               Color(0xFFF5CF60),
//                                               Colors.white,
//                                               Colors.white,
//                                             ],
//                                             stops: [0.0, 0.5, 1.0],
//                                             // Define positions for each color in the gradient
//                                             begin: Alignment.topCenter,
//                                             end: Alignment.bottomCenter,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       left: 4,
//                                       top: 4,
//                                       width: 92,
//                                       height: 92,
//                                       child: Container(
//                                         decoration: const ShapeDecoration(
//                                           color: Color(0xFF381004),
//                                           shape: OvalBorder(),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(2.0),
//                                           child: Container(
//                                             width: 92,
//                                             height: 92,
//                                             decoration: const ShapeDecoration(
//                                               image: DecorationImage(
//                                                 image: NetworkImage(
//                                                     "https://via.placeholder.com/92x92"),
//                                                 fit: BoxFit.fill,
//                                               ),
//                                               shape: OvalBorder(),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             const Column(
//                               children: [
//                                 Text(
//                                   'GOLD',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Color(0xFFF5CF60),
//                                     fontSize: 13,
//                                     fontFamily: 'Work Sans',
//                                     fontWeight: FontWeight.w800,
//                                     height: 0.08,
//                                     letterSpacing: -0.04,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 CommonTextWidget(
//                                   text: "Get extra",
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   letterSpacing: -0.3,
//                                 ),
//                                 CommonTextWidget(
//                                   text: "150 off",
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   letterSpacing: -0.3,
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//
//                 Column(
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(left: 20),
//                       child: Row(
//                         children: [
//                           Text(
//                             "Explore the Sports ",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8, right: 20),
//                       child: SizedBox(
//                         height: 450,
//                         width: double.infinity,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           padding: EdgeInsets.zero,
//                           itemCount: 5,
//                           itemBuilder: ((context, index) {
//                             return InkWell(
//                               onTap: () {
//                                 context.push(SportsPlaces.routeName);
//                               },
//                               child: Column(
//                                 children: [
//                                   Stack(
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 10),
//                                         child: Container(
//                                           width: 334.48,
//                                           height: 450,
//                                           decoration: ShapeDecoration(
//                                             color:
//                                                 Colors.white.withOpacity(0.25),
//                                             shape: RoundedRectangleBorder(
//                                               side: const BorderSide(
//                                                   width: 0.10,
//                                                   color: Colors.white),
//                                               borderRadius:
//                                                   BorderRadius.circular(7.80),
//                                             ),
//                                             shadows: const [
//                                               BoxShadow(
//                                                 color: Color(0x1E18274B),
//                                                 blurRadius: 6.25,
//                                                 offset: Offset(0, 2.78),
//                                                 spreadRadius: -2.08,
//                                               ),
//                                               BoxShadow(
//                                                 color: Color(0x3F000000),
//                                                 blurRadius: 1.39,
//                                                 offset: Offset(0, 1.39),
//                                                 spreadRadius: 0,
//                                               ),
//                                             ],
//                                           ),
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(7.80),
//                                             child: CachedNetworkImage(
//                                               filterQuality: FilterQuality.low,
//                                               fit: BoxFit.cover,
//                                               imageUrl:
//                                                   "https://srv430249.hstgr.cloud/backend/uploads/1703900337374-badminton-concept-with-shuttlecock-racket (2).jpg",
//                                               placeholder: (context, url) =>
//                                                   const Center(
//                                                       child:
//                                                           CircularProgressIndicator()),
//                                               errorWidget: (context, url,
//                                                       error) =>
//                                                   const Center(
//                                                       child: Icon(Icons.error)),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Positioned(
//                                         left: 0,
//                                         right: 0,
//                                         top: 300,
//                                         child: Column(
//                                           children: [
//                                             const Center(
//                                               child: CommonTextWidget(
//                                                 text: "SMIMMING",
//                                                 fontSize: 30,
//                                               ),
//                                             ),
//                                             const CommonTextWidget(
//                                               text: "Playing",
//                                               fontSize: 20,
//                                             ),
//                                             ClipRRect(
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(10)),
//                                               child: BackdropFilter(
//                                                 filter: ImageFilter.blur(
//                                                     sigmaX: 15, sigmaY: 15),
//                                                 child: Container(
//                                                   width: 100,
//                                                   height: 50,
//                                                   decoration: BoxDecoration(
//                                                       color: Colors.grey
//                                                           .withOpacity(0),
//                                                       borderRadius:
//                                                           const BorderRadius
//                                                               .all(
//                                                               Radius.circular(
//                                                                   10))),
//                                                   child: const Center(
//                                                       child: CommonTextWidget(
//                                                     text: "Explore",
//                                                     fontSize: 20,
//                                                   )),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 //*************************************/
//
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 /******************** Top Fitness gym ********************/
//                 Column(
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           CommonTextWidget(
//                               text: "Top Fitness Center in your Area",
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600),
//                           CommonTextWidget(
//                             text: "See All",
//                             color: AppColor.kSecondaryButtonColor,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           )
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         context.push(IndividualSports.routeName);
//                       },
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: Container(
//                               width: double.infinity,
//                               height: 180,
//                               decoration: ShapeDecoration(
//                                 image: const DecorationImage(
//                                   image: AssetImage(
//                                       "assets/images/top_fitness_1.png"),
//                                   fit: BoxFit.fill,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 12),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 CommonTextWidget(
//                                   text: "Planet Fitness and Gym",
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 18,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.star,
//                                       color: Colors.orange,
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     CommonTextWidget(text: '4.5')
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.location_on_outlined,
//                                   size: 30,
//                                 ),
//                                 CommonTextWidget(
//                                   text: "California, New York",
//                                   fontWeight: FontWeight.w400,
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 /******************** Top Fitness gym ********************/
//
//                 InkWell(
//                   onTap: () {
//                     context.push(IndividualGym.routeName);
//                   },
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Container(
//                           width: double.infinity,
//                           height: 180,
//                           decoration: ShapeDecoration(
//                             image: const DecorationImage(
//                               image:
//                                   AssetImage("assets/images/top_fitness_2.png"),
//                               fit: BoxFit.fill,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CommonTextWidget(
//                               text: "Planet Fitness and Gym",
//                               fontWeight: FontWeight.w700,
//                               fontSize: 18,
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.star,
//                                   color: Colors.orange,
//                                 ),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 CommonTextWidget(text: '4.5')
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.location_on_outlined,
//                               size: 30,
//                             ),
//                             CommonTextWidget(
//                               text: "California, New York",
//                               fontWeight: FontWeight.w400,
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: 334.48,
//                   height: 365,
//                   decoration: ShapeDecoration(
//                     color: Colors.white.withOpacity(0.25),
//                     shape: RoundedRectangleBorder(
//                       side: const BorderSide(width: 0.10, color: Colors.white),
//                       borderRadius: BorderRadius.circular(7.80),
//                     ),
//                     shadows: const [
//                       BoxShadow(
//                         color: Color(0x1E18274B),
//                         blurRadius: 6.25,
//                         offset: Offset(0, 2.78),
//                         spreadRadius: -2.08,
//                       ),
//                       BoxShadow(
//                         color: Color(0x3F000000),
//                         blurRadius: 1.39,
//                         offset: Offset(0, 1.39),
//                         spreadRadius: 0,
//                       )
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 16,
//                       ),
//                       const CommonTextWidget(text: "Transform"),
//                       Image.asset('assets/images/loss_weight.png'),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CommonTextWidget(text: 'Before '),
//                           SizedBox(
//                             width: 60,
//                           ),
//                           CommonTextWidget(text: 'After ')
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 7,
//                       ),
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 20),
//                               child: CommonTextWidget(
//                                   text: 'Transform yourself today for'
//                                       ' just ₹ 699 – see the difference tomorrow!',
//                                   textAlign: TextAlign.center),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const CommonTextWidget(
//                           text: "Explore Zatayo",
//                           fontWeight: FontWeight.w700,
//                           fontSize: 20,
//                           letterSpacing: -0.3,
//                         ),
//                         const SizedBox(
//                           height: 22,
//                         ),
//                         SizedBox(
//                           width: double.infinity,
//                           height: 325,
//                           child: ListView.separated(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 7,
//                             itemBuilder: (BuildContext context, int index) {
//                               return InkWell(
//                                 onTap: () {
//                                   context.push(SubscriptionPlan.routeName);
//                                 },
//                                 child: Container(
//                                   width: 200,
//                                   height: 307,
//                                   decoration: ShapeDecoration(
//                                     color: Colors.white.withOpacity(0.25),
//                                     shape: RoundedRectangleBorder(
//                                       side: const BorderSide(
//                                           width: 0.10, color: Colors.white),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     shadows: const [
//                                       BoxShadow(
//                                         color: Color(0x1E18274B),
//                                         blurRadius: 6.41,
//                                         offset: Offset(0, 2.85),
//                                         spreadRadius: -2.14,
//                                       ),
//                                       BoxShadow(
//                                         color: Color(0x3F000000),
//                                         blurRadius: 1.42,
//                                         offset: Offset(0, 1.42),
//                                         spreadRadius: 0,
//                                       )
//                                     ],
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       const SizedBox(
//                                         height: 13,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 13),
//                                         child: Container(
//                                           width: 200,
//                                           height: 158,
//                                           decoration: ShapeDecoration(
//                                             image: const DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/plan.png"),
//                                               fit: BoxFit.fill,
//                                             ),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(7.94),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 15),
//                                         child: Column(
//                                           children: [
//                                             const CommonTextWidget(
//                                               text: "Jatayu Home",
//                                               fontWeight: FontWeight.w600,
//                                               fontSize: 20,
//                                               letterSpacing: -0.3,
//                                             ),
//                                             const SizedBox(
//                                               height: 10,
//                                             ),
//                                             const CommonTextWidget(
//                                               text:
//                                                   "Unlimited access to group classes, all gyms"
//                                                   " and at-home workouts",
//                                               fontSize: 13,
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                             const SizedBox(
//                                               height: 8,
//                                             ),
//                                             Container(
//                                               width: 200,
//                                               decoration: const ShapeDecoration(
//                                                 shape: RoundedRectangleBorder(
//                                                   side: BorderSide(
//                                                     width: 0.70,
//                                                     strokeAlign: BorderSide
//                                                         .strokeAlignCenter,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               height: 8,
//                                             ),
//                                             const Row(
//                                               children: [
//                                                 CommonTextWidget(
//                                                   text: "₹ 1450/month ",
//                                                   fontWeight: FontWeight.w700,
//                                                   fontSize: 12,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 9,
//                                                 ),
//                                                 Expanded(
//                                                   child: CommonTextWidget(
//                                                     text: "Ownards",
//                                                     fontWeight: FontWeight.w300,
//                                                     fontSize: 10,
//                                                   ),
//                                                 ),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                             separatorBuilder:
//                                 (BuildContext context, int index) {
//                               return const SizedBox(
//                                 width: 10,
//                               );
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 Container(
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomLeft,
//                       colors: [
//                         Colors.transparent,
//                         Color(0xFF381004),
//                       ],
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 50),
//                     child: Column(
//                       children: [
//                         const CommonTextWidget(
//                           text: "Unleash",
//                           fontSize: 24,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         const CommonTextWidget(
//                           text: "Your fitness",
//                           fontSize: 24,
//                           fontWeight: FontWeight.w700,
//                         ),
//                         const CommonTextWidget(
//                           text: "Journey today",
//                           fontSize: 24,
//                           fontWeight: FontWeight.w700,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: StaggeredGrid.count(
//                             crossAxisCount: 4,
//                             mainAxisSpacing: 10,
//                             crossAxisSpacing: 10,
//                             children: [
//                               StaggeredGridTile.count(
//                                 crossAxisCellCount: 2,
//                                 mainAxisCellCount: 2,
//                                 child: Container(
//                                   decoration: ShapeDecoration(
//                                     image: const DecorationImage(
//                                       image: AssetImage(
//                                           "assets/images/group_4.png"),
//                                       fit: BoxFit.fill,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(3),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               StaggeredGridTile.count(
//                                 crossAxisCellCount: 2,
//                                 mainAxisCellCount: 3,
//                                 child: Container(
//                                   decoration: ShapeDecoration(
//                                     image: const DecorationImage(
//                                       image: AssetImage(
//                                           "assets/images/group_3.png"),
//                                       fit: BoxFit.fill,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(3),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               StaggeredGridTile.count(
//                                 crossAxisCellCount: 2,
//                                 mainAxisCellCount: 2,
//                                 child: Container(
//                                   decoration: ShapeDecoration(
//                                     image: const DecorationImage(
//                                       image:
//                                           AssetImage("assets/images/plan.png"),
//                                       fit: BoxFit.fill,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(3),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               StaggeredGridTile.count(
//                                 crossAxisCellCount: 2,
//                                 mainAxisCellCount: 2,
//                                 child: Container(
//                                   decoration: ShapeDecoration(
//                                     image: const DecorationImage(
//                                       image:
//                                           AssetImage("assets/images/group.png"),
//                                       fit: BoxFit.fill,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(3),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               StaggeredGridTile.count(
//                                 crossAxisCellCount: 2,
//                                 mainAxisCellCount: 2,
//                                 child: Container(
//                                   decoration: ShapeDecoration(
//                                     image: const DecorationImage(
//                                       image: AssetImage(
//                                           "assets/images/group_1.png"),
//                                       fit: BoxFit.fill,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(3),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
