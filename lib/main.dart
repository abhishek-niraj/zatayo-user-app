import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Flutter Bloc package
import 'package:zatayo/ApiClient/api_client.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/bloc/otp_bloc/otp_bloc.dart';
import 'package:zatayo/constant/app_theme.dart';

import 'bloc/user_profile/user_profile_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OtpBloc(
            ApiClient(),
          ),
        ),
        BlocProvider(
          create: (context) => UserProfileBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
