import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/view/common_widget/common_button_widget.dart';
import 'package:zatayo/view/common_widget/common_container_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';
import 'package:zatayo/view/home_work_out/screen/watch_home_work_out.dart';

class HomeWorkOutSession extends StatefulWidget {
  static const String routeName = "/home-work-out-session";

  const HomeWorkOutSession({super.key});

  @override
  State<HomeWorkOutSession> createState() => _HomeWorkOutSessionState();
}

class _HomeWorkOutSessionState extends State<HomeWorkOutSession> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonTextWidget(text: 'Yoga Sessions'),
      ),
      body: Container(

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
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          context.push(WatchHomeWorkOut.routeName);
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF222222),
                                ),
                                child: Row(
                                  children: [
                                    ContainerWidget(
                                      borderRadius: 10,
                                      height: 145,
                                      width: 100,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 12),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CommonTextWidget(
                                              text: 'Yoga by Nisha',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            CommonTextWidget(
                                              text:
                                                  'Rejuvenate with Nisha Yoga Live—mindful'
                                                  ' practices, personalized guidance,'
                                                  ' and holistic wellness.',
                                              overflow: TextOverflow.fade,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFE7E7E7),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: CommonTextWidget(
                                                    text: '250 Kcal | Time: 30 min',
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFFE7E7E7),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ),
                                                SizedBox(width: 20,),
                                                Expanded(
                                                  child: ContainerWidget(borderRadius: 5,
                                                  height: 35,
                                                    borderColor: Colors.transparent,
                                                    borderWidth: 0,
                                                    backgroundColor: AppColor.kSecondaryButtonColor,
                                                    child: Center(child: CommonTextWidget(text: 'Watch Now',
                                                    fontWeight: FontWeight.w600,
                                                      fontSize: 14,
                                                    )),
                                                  )
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF222222),
                              ),
                              child: Row(
                                children: [
                                  ContainerWidget(
                                    borderRadius: 10,
                                    height: 145,
                                    width: 100,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CommonTextWidget(
                                            text: 'Yoga by Pooja',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          CommonTextWidget(
                                            text:
                                            'Rejuvenate with Nisha Yoga Live—mindful'
                                                ' practices, personalized guidance,'
                                                ' and holistic wellness.',
                                            overflow: TextOverflow.fade,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFFE7E7E7),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CommonTextWidget(
                                                  text: '250 Kcal | Time: 30 min',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFE7E7E7),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              SizedBox(width: 20,),
                                              Expanded(
                                                  child: ContainerWidget(borderRadius: 5,
                                                    height: 35,
                                                    borderColor: Colors.transparent,
                                                    borderWidth: 0,
                                                    backgroundColor: AppColor.kSecondaryButtonColor,
                                                    child: Center(child: CommonTextWidget(text: 'Watch Now',
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 14,
                                                    )),
                                                  )
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
