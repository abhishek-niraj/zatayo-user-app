import 'package:flutter/material.dart';
import 'package:zatayo/view/common_widget/common_app_bar_widget.dart';
import 'package:zatayo/view/common_widget/common_container_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';
class NotificationScreen extends StatefulWidget {
  static const String routeName = "/notification-screen";
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonAppBarWidget(title: "Notifications"),
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
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                         Stack(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(top: 5),
                               child: ContainerWidget(borderRadius: 45,
                                 height: 57,
                                 width: 57,
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(45),
                                   child: Image.asset('assets/images/plan.png',
                                   fit: BoxFit.cover,
                                   ),
                                 ),
                               ),
                             ),
                             Positioned(
                               right: 0,
                               top: 0,
                               child: ContainerWidget(borderRadius: 45,
                                 height: 20,
                                 width: 20,
                                 backgroundColor: Color(0xFFD7443A),
                                 borderColor: Colors.transparent,
                                 borderWidth: 0,
                                 child: Center(child: CommonTextWidget(text: '1',
                                   fontWeight: FontWeight.w700,
                                   fontSize: 10,
                                 )),
                               ),
                             ),
                           ],
                         ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget(text: 'Homework out  with Sumit  Is LIVE',
                              fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              CommonTextWidget(text: '🏋️ Sumit is working out! Join now '
                                  'and crush ittogether! 💪',
                               fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: Color(0xFFCCCCCC),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CommonTextWidget(text: '1m ago.',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6C6C6C),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xFF6C6C6C),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: ContainerWidget(borderRadius: 45,
                                height: 57,
                                width: 57,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(45),
                                  child: Image.asset('assets/images/plan.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: ContainerWidget(borderRadius: 45,
                                height: 20,
                                width: 20,
                                backgroundColor: Color(0xFFD7443A),
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                child: Center(child: CommonTextWidget(text: '1',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget(text: 'Homework out  with Sumit  Is LIVE',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              CommonTextWidget(text: '🏋️ Sumit is working out! Join now '
                                  'and crush ittogether! 💪',
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: Color(0xFFCCCCCC),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CommonTextWidget(text: '1m ago.',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6C6C6C),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xFF6C6C6C),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: ContainerWidget(borderRadius: 45,
                                height: 57,
                                width: 57,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(45),
                                  child: Image.asset('assets/images/plan.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: ContainerWidget(borderRadius: 45,
                                height: 20,
                                width: 20,
                                backgroundColor: Color(0xFFD7443A),
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                child: Center(child: CommonTextWidget(text: '1',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget(text: 'Homework out  with Sumit  Is LIVE',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              CommonTextWidget(text: '🏋️ Sumit is working out! Join now '
                                  'and crush ittogether! 💪',
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: Color(0xFFCCCCCC),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CommonTextWidget(text: '1m ago.',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6C6C6C),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xFF6C6C6C),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: ContainerWidget(borderRadius: 45,
                                height: 57,
                                width: 57,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(45),
                                  child: Image.asset('assets/images/plan.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: ContainerWidget(borderRadius: 45,
                                height: 20,
                                width: 20,
                                backgroundColor: Color(0xFFD7443A),
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                child: Center(child: CommonTextWidget(text: '1',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget(text: 'Homework out  with Sumit  Is LIVE',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              CommonTextWidget(text: '🏋️ Sumit is working out! Join now '
                                  'and crush ittogether! 💪',
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: Color(0xFFCCCCCC),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CommonTextWidget(text: '1m ago.',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6C6C6C),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xFF6C6C6C),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
