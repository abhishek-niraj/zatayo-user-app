import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Flutter Bloc package
import 'package:zatayo/ApiClient/api_client.dart';
import 'package:zatayo/app_router.dart';
import 'package:zatayo/constant/app_theme.dart';
import 'package:zatayo/cubit/customer_details/get_my_plan_information_cubit.dart';
import 'package:zatayo/cubit/fitness_banner/fitness_banner_cubit.dart';
import 'package:zatayo/cubit/scann_bar_code/scan_bar_code_cubit.dart';
import 'package:zatayo/cubit/subscription_benefits/subscription_benefits_cubit.dart';
import 'package:zatayo/cubit/subscription_plan/add_subscription_cubit.dart';
import 'package:zatayo/general_bloc_provider.dart';
import 'bloc/otp_bloc/otp_bloc.dart';
import 'bloc/user_profile/user_profile_bloc.dart';
import 'cubit/center/get_center_cubit.dart';
import 'cubit/center/select_center_cubit.dart';
import 'cubit/customer_details/customer_basic_information_cubit.dart';
import 'cubit/customer_details/customer_details_cubit.dart';
import 'cubit/customer_details/customer_sport_visited_api_cubit.dart';
import 'cubit/customer_details/update_user_profle_cubit.dart';
import 'cubit/customer_details/user_selected_location_information_cubit.dart';
import 'cubit/deal_of_day/get_deal_of_day_cubit.dart';
import 'cubit/fitness/fitness_cubit.dart';
import 'cubit/home_page_banner/home_page_banner_cubit.dart';
import 'cubit/skip/user_skip_cubit.dart';
import 'cubit/sport/get_sport_by_id_cubit.dart';
import 'cubit/sport/get_sport_cubit.dart';
import 'cubit/sport/get_top_sport_cubit.dart';
import 'cubit/subscription_plan/buy_subscription_plan_cubit.dart';
import 'cubit/subscription_plan/subscription_plan_activation_cubit.dart';
import 'cubit/subscription_plan/subscription_plan_cubit.dart';

void main() {
  final apiClient = ApiClient();
  runApp(MyApp(
    apiClient: apiClient,
  ));
}

class MyApp extends StatelessWidget {
  final ApiClient apiClient;

  const MyApp({required this.apiClient, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OtpBloc(
            apiClient,
          ),
        ),
        BlocProvider(
          create: (context) => UserProfileBloc(),
        ),
        BlocProvider(
          create: (context) => HomePageBannerCubit(
            apiClient,
          ),
        ),
        BlocProvider(
          create: (context) => FitnessBannerCubit(
            apiClient,
          ),
        ),
        BlocProvider(
          create: (context) => CustomerDetailsCubit(
            apiClient,
          ),
        ),
        BlocProvider(
          create: (context) => FitnessCubit(
            apiClient,
          ),
        ),
        BlocProvider(
          create: (context) => SubscriptionPlanCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => SubscriptionBenefitsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => AddSubscriptionCubit(),
        ),
        BlocProvider(
          create: (context) => BuySubscriptionPlanCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetSportCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetSportByIdCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetTopSportCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetCenterCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => SelectCenterCubit(),
        ),
        BlocProvider(
          create: (context) => GetDealOfDayCubit(apiClient),
        ),
        BlocProvider(create: (context) => ScanBarCodeCubit(apiClient)),
        BlocProvider(
            create: (context) => UserSelectedLocationInformationCubit()),
        BlocProvider(create: (context) => UpdateUserProfileCubit()),
        BlocProvider(create: (context) => CustomerSportVisitedBloc(apiClient)),
        BlocProvider(create: (context) => CustomerBasicInformationCubit()),
        BlocProvider(create: (context) => GetMyPlanInformationCubit(apiClient)),
        BlocProvider(create: (context) => SubscriptionPlanActivationCubit(apiClient)),
        BlocProvider(create: (context) => UserSkipCubit(apiClient)),

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
