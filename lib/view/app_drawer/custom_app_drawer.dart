import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zatayo/constant/app_color.dart';
import 'package:zatayo/view/common_widget/common_snack_bar_widget.dart';
import 'package:zatayo/view/common_widget/common_text_widget.dart';

import '../Profile/screen/profile_screen.dart';
import '../common_widget/cuportino_dialog.dart';

class CustomAppDrawer extends StatefulWidget {
  const CustomAppDrawer({super.key});

  @override
  State<CustomAppDrawer> createState() => _CustomAppDrawerState();
}

class _CustomAppDrawerState extends State<CustomAppDrawer> {
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color(0xFF381004),
              Color(0xFFB7340B),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.person,
                      ),
                      title: const Text(
                        'Profile',
                        style: TextStyle(),
                      ),
                      onTap: () {
                        context.push(ProfileScreen.routeName);
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.event_note_sharp,
                      ),
                      title: const Text(
                        'Privacy Policy',
                        style: TextStyle(),
                      ),
                      onTap: () {
                        // Navigator.pop(context);
                        // Navigator.pushNamed(context, TermConditionScreen.routeName);

                        final Uri _url = Uri.parse(
                            'https://dashboard.zatayo.com/privacy-policy');
                        launchUrl(_url);
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.event_note_sharp,
                      ),
                      title: const Text(
                        'Terms & Conditions',
                        style: TextStyle(),
                      ),
                      onTap: () {
                        // Navigator.pop(context);
                        // Navigator.pushNamed(context, TermConditionScreen.routeName);
                        final Uri url = Uri.parse(
                            'https://dashboard.zatayo.com/terms-and-conditions');
                        launchUrl(url);
                      },
                    ),
                  ],
                )),
                ListTile(
                  leading: const Icon(
                    Icons.person_off,
                  ),
                  title: const Text(
                    ' Delete Profile',
                    style: TextStyle(),
                  ),
                  onTap: () {
                    showCustomAlertDialog(
                        context: context,
                        contentText: "Are you sure to delete profile ?",
                        onCancel: () {
                          context.pop();
                        },
                        onConfirm: () {
                          context.pop();
                          showSSnackBar(context, "Account deleted successfully",
                              Colors.red);
                          GoRouter.of(context).goNamed('enter-phone-number');
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
