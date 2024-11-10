import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:zatayo/constant/app_color.dart';

import '../../common_widget/common_text_widget.dart';

class HomeV2 extends StatefulWidget {
  const HomeV2({super.key});

  @override
  State<HomeV2> createState() => _HomeV2State();
}

class _HomeV2State extends State<HomeV2> {
  int _selectedPageIndex = 0;

  // Controller for the PageView to manage page switching
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose(); // Dispose the controller when not needed
    super.dispose();
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
            duration: Duration(milliseconds: 1),
            curve: Curves.easeInOut,
          );
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        children: [
          HomePage(),
          Center(child: Text('Fitness Page')),
          Center(child: Text('Scan Page')),
          Center(child: Text('Sports Page')),
          Center(child: Text('Profile Page')),
        ],
      ),
    );
  }
}

// Example Pages
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 44,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF818898),
                          fontSize: 14,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.28,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Hi, Abhishek Niraj !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFD3D1D8),
                          fontSize: 18,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFDFE1E7)),
                        borderRadius: BorderRadius.circular(48),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Icon(Icons.notifications_none_outlined,
                            size: 27,
                              color: Color(0xFFF5F5F5),
                            ),),
                        Positioned(
                          left: 25,
                          top: 15,
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: ShapeDecoration(
                              color: Color(0xFFDF1C41),
                              shape: OvalBorder(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Container(
            child: Image.asset(
              "assets/images/offer_image.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF381004),
                  Color(0xFFB7340B),
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Deal of the day",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 100,
                      height: 150,
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 82,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: ShapeDecoration(
                                        shape: OvalBorder(
                                          side: BorderSide(
                                            width: 1.30,
                                          ),
                                        ),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                          // Define positions for each color in the gradient
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 4,
                                    top: 4,
                                    width: 92,
                                    height: 92,
                                    child: Container(
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF381004),
                                        shape: OvalBorder(),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width: 92,
                                          height: 92,
                                          decoration: const ShapeDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://via.placeholder.com/92x92"),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Text(
                                'DIAMOND',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFF5CF60),
                                  fontSize: 13,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w800,
                                  height: 0.08,
                                  letterSpacing: -0.04,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CommonTextWidget(
                                text: "Get extra",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.3,
                              ),
                              CommonTextWidget(
                                text: "150 off",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.3,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 100,
                      height: 150,
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 82,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    width: 100,
                                    height: 100,
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: const ShapeDecoration(
                                        shape: OvalBorder(
                                          side: BorderSide(
                                            width: 1.30,
                                          ),
                                        ),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFF5CF60),
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                          // Define positions for each color in the gradient
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 4,
                                    top: 4,
                                    width: 92,
                                    height: 92,
                                    child: Container(
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF381004),
                                        shape: OvalBorder(),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width: 92,
                                          height: 92,
                                          decoration: const ShapeDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://via.placeholder.com/92x92"),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Text(
                                'GOLD',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFF5CF60),
                                  fontSize: 13,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w800,
                                  height: 0.08,
                                  letterSpacing: -0.04,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CommonTextWidget(
                                text: "Get extra",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.3,
                              ),
                              CommonTextWidget(
                                text: "150 off",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.3,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 100,
                      height: 150,
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 82,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: const ShapeDecoration(
                                        shape: OvalBorder(
                                          side: BorderSide(
                                            width: 1.30,
                                          ),
                                        ),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFF5CF60),
                                            Colors.white,
                                            Colors.white,
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                          // Define positions for each color in the gradient
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 4,
                                    top: 4,
                                    width: 92,
                                    height: 92,
                                    child: Container(
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF381004),
                                        shape: OvalBorder(),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width: 92,
                                          height: 92,
                                          decoration: const ShapeDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://via.placeholder.com/92x92"),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Text(
                                'GOLD',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFF5CF60),
                                  fontSize: 13,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w800,
                                  height: 0.08,
                                  letterSpacing: -0.04,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CommonTextWidget(
                                text: "Get extra",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.3,
                              ),
                              CommonTextWidget(
                                text: "150 off",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.3,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            "Explore the Sports ",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 20),
                      child: SizedBox(
                        height: 450,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemCount: 5,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        width: 334.48,
                                        height: 450,
                                        decoration: ShapeDecoration(
                                          color: Colors.white.withOpacity(0.25),
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 0.10,
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(7.80),
                                          ),
                                          shadows: [
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
                                          borderRadius:
                                              BorderRadius.circular(7.80),
                                          child: CachedNetworkImage(
                                            filterQuality: FilterQuality.low,
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                "https://srv430249.hstgr.cloud/backend/uploads/1703900337374-badminton-concept-with-shuttlecock-racket (2).jpg",
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget: (context, url,
                                                    error) =>
                                                const Center(
                                                    child: Icon(Icons.error)),
                                          ),
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
                                              text: "SMIMMING",
                                              fontSize: 30,
                                            ),
                                          ),
                                          CommonTextWidget(
                                            text: "Playing",
                                            fontSize: 20,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 15, sigmaY: 15),
                                              child: Container(
                                                width: 100,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
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
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                //*************************************/

                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CommonTextWidget(
                          text: "Explore Zatayo",
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          letterSpacing: -0.3,
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          height: 116,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.25),
                            shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(width: 0.10, color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x1E18274B),
                                blurRadius: 6.41,
                                offset: Offset(0, 2.85),
                                spreadRadius: -2.14,
                              ),
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 1.42,
                                offset: Offset(0, 1.42),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 116,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.25),
                            shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(width: 0.10, color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x1E18274B),
                                blurRadius: 6.41,
                                offset: Offset(0, 2.85),
                                spreadRadius: -2.14,
                              ),
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 1.42,
                                offset: Offset(0, 1.42),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Top Fitness Center in your Area",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/327x180"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 334.48,
                  height: 365,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.25),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.10, color: Colors.white),
                      borderRadius: BorderRadius.circular(7.80),
                    ),
                    shadows: [
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
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FitnessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Fitness Page'));
  }
}
