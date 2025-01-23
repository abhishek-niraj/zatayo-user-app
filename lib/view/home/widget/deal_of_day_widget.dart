import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/ApiClient/api_client.dart';

import '../../../cubit/deal_of_day/get_deal_of_day_cubit.dart';
import '../../common_widget/common_text_widget.dart';
import '../../subscriptionplan/subscription_plan.dart';

class DealOfDayWidget extends StatefulWidget {
  const DealOfDayWidget({super.key});

  @override
  State<DealOfDayWidget> createState() => _DealOfDayWidgetState();
}

class _DealOfDayWidgetState extends State<DealOfDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Builder(
        builder: (context) {
          final dealOfDay =
              context.watch<GetDealOfDayCubit>().getDealOfDayResponseModel;

          // Check if data is available
          if (dealOfDay.data != null && dealOfDay.data!.isNotEmpty) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: dealOfDay.data!.map((data) {
                return InkWell(
                  onTap: () {
                    context.push(SubscriptionPlan.routeName);
                  },
                  child: SizedBox(
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
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                '$baseUrl/${data.image}'
                                                     // Replace with the actual image URL
                                                ),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: const OvalBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              data.onPlan ?? '',
                              // You may want to replace this with dynamic data
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
                            const SizedBox(
                              height: 5,
                            ),
                            CommonTextWidget(
                              text: data.titleOne ?? '',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.3,
                            ),
                            CommonTextWidget(
                              text: data.titleTwo ?? '',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }
          // Show a loading indicator or a message if data is null or empty
          return SizedBox(); // Or a message like "No deals available"
        },
      ),
    );
  }
}

// const SizedBox(
//   width: 20,
// ),
// InkWell(
//   onTap: () {
//     context.push(SubscriptionPlan.routeName);
//   },
//   child: SizedBox(
//     width: 100,
//     height: 150,
//     child: Column(
//       children: [
//         Container(
//           width: 100,
//           height: 82,
//           clipBehavior: Clip.antiAlias,
//           decoration: const BoxDecoration(),
//           child: SizedBox(
//             width: 100,
//             height: 100,
//             child: Stack(
//               children: [
//                 Positioned(
//                   left: 0,
//                   top: 0,
//                   child: Container(
//                     width: 100,
//                     height: 100,
//                     decoration: const ShapeDecoration(
//                       shape: OvalBorder(
//                         side: BorderSide(
//                           width: 1.30,
//                         ),
//                       ),
//                       gradient: LinearGradient(
//                         colors: [
//                           Color(0xFFF5CF60),
//                           Colors.white,
//                           Colors.white,
//                         ],
//                         stops: [0.0, 0.5, 1.0],
//                         // Define positions for each color in the gradient
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 4,
//                   top: 4,
//                   width: 92,
//                   height: 92,
//                   child: Container(
//                     decoration: const ShapeDecoration(
//                       color: Color(0xFF381004),
//                       shape: OvalBorder(),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(2.0),
//                       child: Container(
//                         width: 92,
//                         height: 92,
//                         // decoration: const ShapeDecoration(
//                         //   image: DecorationImage(
//                         //     image: NetworkImage(
//                         //         "https://via.placeholder.com/92x92"),
//                         //     fit: BoxFit.fill,
//                         //   ),
//                         //   shape: OvalBorder(),
//                         // ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         const Column(
//           children: [
//             Text(
//               'GOLD',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color(0xFFF5CF60),
//                 fontSize: 13,
//                 fontFamily: 'Work Sans',
//                 fontWeight: FontWeight.w800,
//                 height: 0.08,
//                 letterSpacing: -0.04,
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             CommonTextWidget(
//               text: "Get extra",
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               letterSpacing: -0.3,
//             ),
//             CommonTextWidget(
//               text: "150 off",
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               letterSpacing: -0.3,
//             )
//           ],
//         ),
//       ],
//     ),
//   ),
// ),
