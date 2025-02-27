import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zatayo/ApiClient/api_client.dart';
import 'package:zatayo/bloc/otp_bloc/otp_bloc.dart';
import 'package:zatayo/bloc/user_profile/user_profile_bloc.dart';
import 'package:zatayo/cubit/center/get_center_cubit.dart';
import 'package:zatayo/cubit/center/select_center_cubit.dart';
import 'package:zatayo/cubit/customer_details/customer_details_cubit.dart';
import 'package:zatayo/cubit/customer_details/user_selected_location_information_cubit.dart';
import 'package:zatayo/cubit/deal_of_day/get_deal_of_day_cubit.dart';
import 'package:zatayo/cubit/fitness/fitness_cubit.dart';
import 'package:zatayo/cubit/fitness_banner/fitness_banner_cubit.dart';
import 'package:zatayo/cubit/home_page_banner/home_page_banner_cubit.dart';
import 'package:zatayo/cubit/scann_bar_code/scan_bar_code_cubit.dart';
import 'package:zatayo/cubit/sport/get_sport_by_id_cubit.dart';
import 'package:zatayo/cubit/sport/get_sport_cubit.dart';
import 'package:zatayo/cubit/sport/get_top_sport_cubit.dart';
import 'package:zatayo/cubit/subscription_benefits/subscription_benefits_cubit.dart';
import 'package:zatayo/cubit/subscription_plan/add_subscription_cubit.dart';
import 'package:zatayo/cubit/subscription_plan/buy_subscription_plan_cubit.dart';
import 'package:zatayo/cubit/subscription_plan/subscription_plan_cubit.dart';

List<BlocProvider> getBlocProviders(ApiClient apiClient) {
  return [
    BlocProvider(create: (context) => OtpBloc(apiClient)),
    BlocProvider(create: (context) => UserProfileBloc()),
    BlocProvider(create: (context) => HomePageBannerCubit(apiClient)),
    BlocProvider(create: (context) => FitnessBannerCubit(apiClient)),
    BlocProvider(create: (context) => CustomerDetailsCubit(apiClient)),
    BlocProvider(create: (context) => FitnessCubit(apiClient)),
    BlocProvider(create: (context) => SubscriptionPlanCubit(apiClient)),
    BlocProvider(create: (context) => SubscriptionBenefitsCubit(apiClient)),
    BlocProvider(create: (context) => AddSubscriptionCubit()),
    BlocProvider(create: (context) => BuySubscriptionPlanCubit(apiClient)),
    BlocProvider(create: (context) => GetSportCubit(apiClient)),
    BlocProvider(create: (context) => GetSportByIdCubit(apiClient)),
    BlocProvider(create: (context) => GetTopSportCubit(apiClient)),
    BlocProvider(create: (context) => GetCenterCubit(apiClient)),
    BlocProvider(create: (context) => SelectCenterCubit()),
    BlocProvider(create: (context) => GetDealOfDayCubit(apiClient)),
    BlocProvider(create: (context) => ScanBarCodeCubit(apiClient)),
    BlocProvider(create: (context) => UserSelectedLocationInformationCubit()),
  ];
}
