import 'package:go_router/go_router.dart';
import 'package:zatayo/view/Profile/screen/edit_profile_screen.dart';
import 'package:zatayo/view/Profile/screen/my_friend_screen.dart';
import 'package:zatayo/view/Profile/screen/profile_screen.dart';
import 'package:zatayo/view/feed_page/screen/feed_screen.dart';
import 'package:zatayo/view/individual_sports_gym/screen/individual_gym.dart';
import 'package:zatayo/view/individual_sports_gym/screen/individual_sports.dart';
import 'package:zatayo/view/login/screen/enter_phone_number_screen.dart';
import 'package:zatayo/view/login/screen/user_name_screen.dart';
import 'package:zatayo/view/login/screen/verify_otp_screen.dart';
import 'package:zatayo/view/near_by_gym/screen/near_by_gyms.dart';
import 'package:zatayo/view/sports_places/screen/sports_places.dart';
import 'package:zatayo/view/subscriptionplan/screen/buy_subscription_plan.dart';
import 'package:zatayo/view/subscriptionplan/screen/subscription_plan_details.dart';
import 'package:zatayo/view/subscriptionplan/screen_argumnet/buy_subscription_plan_screen_argument.dart';
import 'package:zatayo/view/subscriptionplan/subscription_plan.dart';
import 'package:zatayo/view/subscriptionplan/widget/subscription_plan_details_screen_argument.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // GoRoute(
      //   name: 'enter-phone-number',
      //   path: '/',
      //   builder: (context, state) =>  EnterPhoneNumberScreen(),
      // ),
      GoRoute(
          path: "/",
          name: "near-by-gyms",
          builder: (context, state) => const HomeV2()),
      GoRoute(
        name: 'verifyOtpScreen',
        path: '/verify-otp-screen',
        builder: (context, state) => const VerifyOtpScreen(),
      ),
      GoRoute(
          path: '/user-name-screen',
          name: 'user-name-screen',
          builder: (context, state) => UserNameScreen()),
      GoRoute(
          path: '/feed-page',
          name: 'feed-page',
          builder: (context, state) => const HomeV2()),
      GoRoute(
          path: '/profile-screen',
          name: "profileScreen",
          builder: (context, state) => const ProfileScreen()),
      GoRoute(
          path: "/edit-profile",
          name: "editProfile",
          builder: (context, state) => const EditProfileScreen()),
      GoRoute(
          path: "/my-friends-screen",
          name: "myFriends",
          builder: (context, state) => const MyFriendScreen()),
      GoRoute(
          path: "/near-by-gyms",
          name: "nearByGyms",
          builder: (context, state) => const NearByGyms()),
      GoRoute(
          name: "sportsPlaces",
          path: "/sport-places",
          builder: (context, state) => const SportsPlaces()),
      GoRoute(
          name: "individualSports",
          path: "/individual-sports",
          builder: (context, state) => const IndividualSports()),
      GoRoute(
          name: "individualGym",
          path: "/individual-gym",
          builder: (context, state) => const IndividualGym()),
      GoRoute(
          name: "subscriptionPlan",
          path: "/subscription-plan",
          builder: (context, state) => const SubscriptionPlan()),
      GoRoute(
          name: "subscriptionPlanDetails",
          path: "/subscription-plan-details",
          builder: (context, state) {
            final args = state.extra as SubscriptionPlanDetailsScreenArgument;
            return SubscriptionPlanDetails(
              planDetails: args,
            );
          }),
      GoRoute(
          name: "buySubscriptionPlan",
          path: "/buy-subscription-plan",
          builder: (context, state) {
            final args = state.extra as BuySubscriptionPlanScreenArgument;
            return BuySubscriptionPlan(
              planDetails: args,
            );
          }),
    ],
  );
}
