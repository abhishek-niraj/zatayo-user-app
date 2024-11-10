import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zatayo/view/feed_page/screen/feed_screen.dart';
import 'package:zatayo/view/login/screen/enter_phone_number_screen.dart';
import 'package:zatayo/view/login/screen/user_name_screen.dart';
import 'package:zatayo/view/login/screen/verify_otp_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'enter-phone-number',
        path: '/',
        builder: (context, state) =>  EnterPhoneNumberScreen(),
      ),
      GoRoute(
        name: 'verifyOtpScreen',
        path: '/verify-otp-screen',
        builder: (context, state) => const VerifyOtpScreen(),
      ),
      GoRoute(path: '/user-name-screen',
      name: 'user-name-screen',
        builder: (context,state) =>  UserNameScreen()
      ),
      GoRoute(path: '/feed-page',
          name: 'feed-page',
          builder: (context,state) =>  HomeV2()
      ),
    ],
  );
}
