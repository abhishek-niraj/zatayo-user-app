import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Flutter Bloc package
import 'package:zatayo/ApiClient/api_client.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/bloc/otp_bloc/otp_bloc.dart';
import 'package:zatayo/constant/app_theme.dart';
import 'package:zatayo/cubit/fitness_banner/fitness_banner_cubit.dart';
import 'package:zatayo/cubit/subscription_benefits/subscription_benefits_cubit.dart';

import 'bloc/user_profile/user_profile_bloc.dart';
import 'cubit/customer_details/customer_details_cubit.dart';
import 'cubit/fitness/fitness_cubit.dart';
import 'cubit/home_page_banner/home_page_banner_cubit.dart';
import 'cubit/subscription_plan/subscription_plan_cubit.dart';

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
        BlocProvider(
          create: (context) => HomePageBannerCubit(
            ApiClient(),
          ),
        ),
        BlocProvider(
          create: (context) => FitnessBannerCubit(
            ApiClient(),
          ),
        ),
        BlocProvider(
          create: (context) => CustomerDetailsCubit(
            ApiClient(),
          ),
        ),
        BlocProvider(
          create: (context) => FitnessCubit(
            ApiClient(),
          ),
        ),
        BlocProvider(
          create: (context) => SubscriptionPlanCubit(ApiClient()),
        ),
        BlocProvider(
          create: (context) => SubscriptionBenefitsCubit(ApiClient()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Zatatyo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
