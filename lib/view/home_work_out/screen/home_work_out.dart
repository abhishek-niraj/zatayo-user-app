import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/view/common_widget/common_app_bar_widget.dart';
import 'package:zatayo/view/home_work_out/screen/home_work_out_session.dart';

import '../../common_widget/common_item.dart';
import '../../common_widget/common_text_widget.dart';
class HomeWorkOut extends StatefulWidget {
  static const String routeName = "/home-work-out";
  const HomeWorkOut({super.key});

  @override
  State<HomeWorkOut> createState() => _HomeWorkOutState();
}

class _HomeWorkOutState extends State<HomeWorkOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonAppBarWidget(title: 'Home Activity')
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Colors.transparent,
              Color(0xFFB7340B),
            ],
          ),
        ),
        child:
        Center(
          child: Text("Coming Soon"),
        ),
      ),
    );
  }
}


// class HomeWorkOutNew extends StatelessWidget {
//   const HomeWorkOutNew({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 30),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     context.push(HomeWorkOutSession.routeName);
//                   },
//                   child: SizedBox(
//                     width: 100,
//                     height: 150,
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 100,
//                           height: 82,
//                           clipBehavior: Clip.antiAlias,
//                           decoration: const BoxDecoration(),
//                           child: SizedBox(
//                             width: 100,
//                             height: 100,
//                             child: Stack(
//                               children: [
//                                 Positioned(
//                                   left: 0,
//                                   top: 0,
//                                   child: Container(
//                                     width: 100,
//                                     height: 100,
//                                     decoration: const ShapeDecoration(
//                                       shape: OvalBorder(
//                                         side: BorderSide(
//                                           width: 1.30,
//                                         ),
//                                       ),
//                                       gradient: LinearGradient(
//                                         colors: [
//                                           Colors.white,
//                                           Colors.white,
//                                           Colors.white,
//                                         ],
//                                         stops: [0.0, 0.5, 1.0],
//                                         // Define positions for each color in the gradient
//                                         begin: Alignment.topCenter,
//                                         end: Alignment.bottomCenter,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   left: 4,
//                                   top: 4,
//                                   width: 92,
//                                   height: 92,
//                                   child: Container(
//                                     decoration: const ShapeDecoration(
//                                       color: Color(0xFF381004),
//                                       shape: OvalBorder(),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(2.0),
//                                       child: Container(
//                                         width: 92,
//                                         height: 92,
//                                         decoration: const ShapeDecoration(
//                                           image: DecorationImage(
//                                             image: AssetImage(
//                                                 "assets/images/plan.png"),
//                                             fit: BoxFit.fill,
//                                           ),
//                                           shape: OvalBorder(),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         const Column(
//                           children: [
//                             Text(
//                               'Yoga',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontFamily: 'Work Sans',
//                                 fontWeight: FontWeight.w600,
//                                 height: 0.08,
//                                 letterSpacing: -0.04,
//                               ),
//                             ),
//
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     context.push(HomeWorkOutSession.routeName);
//                   },
//                   child: SizedBox(
//                     width: 100,
//                     height: 150,
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 100,
//                           height: 82,
//                           clipBehavior: Clip.antiAlias,
//                           decoration: const BoxDecoration(),
//                           child: SizedBox(
//                             width: 100,
//                             height: 100,
//                             child: Stack(
//                               children: [
//                                 Positioned(
//                                   left: 0,
//                                   top: 0,
//                                   width: 100,
//                                   height: 100,
//                                   child: Container(
//                                     width: 100,
//                                     height: 100,
//                                     decoration: const ShapeDecoration(
//                                       shape: OvalBorder(
//                                         side: BorderSide(
//                                           width: 1.30,
//                                         ),
//                                       ),
//                                       gradient: LinearGradient(
//                                         colors: [
//                                           Color(0xFFF5CF60),
//                                           Colors.white,
//                                           Colors.white,
//                                         ],
//                                         stops: [0.0, 0.5, 1.0],
//                                         // Define positions for each color in the gradient
//                                         begin: Alignment.topCenter,
//                                         end: Alignment.bottomCenter,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   left: 4,
//                                   top: 4,
//                                   width: 92,
//                                   height: 92,
//                                   child: Container(
//                                     decoration: const ShapeDecoration(
//                                       color: Color(0xFF381004),
//                                       shape: OvalBorder(),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(2.0),
//                                       child: Container(
//                                         width: 92,
//                                         height: 92,
//                                         decoration: const ShapeDecoration(
//                                           image: DecorationImage(
//                                             image: AssetImage(
//                                                 "assets/images/plan.png"),
//                                             fit: BoxFit.fill,
//                                           ),
//                                           shape: OvalBorder(),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         const Column(
//                           children: [
//                             Text(
//                               'Dance',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontFamily: 'Work Sans',
//                                 fontWeight: FontWeight.w600,
//                                 height: 0.08,
//                                 letterSpacing: -0.04,
//                               ),
//                             ),
//
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     context.push(HomeWorkOutSession.routeName);
//                   },
//                   child: SizedBox(
//                     width: 100,
//                     height: 150,
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 100,
//                           height: 82,
//                           clipBehavior: Clip.antiAlias,
//                           decoration: const BoxDecoration(),
//                           child: SizedBox(
//                             width: 100,
//                             height: 100,
//                             child: Stack(
//                               children: [
//                                 Positioned(
//                                   left: 0,
//                                   top: 0,
//                                   child: Container(
//                                     width: 100,
//                                     height: 100,
//                                     decoration: const ShapeDecoration(
//                                       shape: OvalBorder(
//                                         side: BorderSide(
//                                           width: 1.30,
//                                         ),
//                                       ),
//                                       gradient: LinearGradient(
//                                         colors: [
//                                           Color(0xFFF5CF60),
//                                           Colors.white,
//                                           Colors.white,
//                                         ],
//                                         stops: [0.0, 0.5, 1.0],
//                                         // Define positions for each color in the gradient
//                                         begin: Alignment.topCenter,
//                                         end: Alignment.bottomCenter,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   left: 4,
//                                   top: 4,
//                                   width: 92,
//                                   height: 92,
//                                   child: Container(
//                                     decoration: const ShapeDecoration(
//                                       color: Color(0xFF381004),
//                                       shape: OvalBorder(),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(2.0),
//                                       child: Container(
//                                         width: 92,
//                                         height: 92,
//                                         decoration: const ShapeDecoration(
//                                           image: DecorationImage(
//                                             image: NetworkImage(
//                                                 "https://via.placeholder.com/92x92"),
//                                             fit: BoxFit.fill,
//                                           ),
//                                           shape: OvalBorder(),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         const Column(
//                           children: [
//                             Text(
//                               'Yoga',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//
//                                 fontSize: 13,
//                                 fontFamily: 'Work Sans',
//                                 fontWeight: FontWeight.w600,
//                                 height: 0.08,
//                                 letterSpacing: -0.04,
//                               ),
//                             ),
//
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: CommonTextWidget(text: 'Home Workout by Sumit',
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 18,
//                 ),
//                 CommonItem(),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: CommonTextWidget(text: 'Watch Yoga By Nisha',
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 18,
//                 ),
//                 CommonItem(),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

