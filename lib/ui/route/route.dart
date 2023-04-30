import 'package:get/get.dart';
import 'package:shelter/ui/views/auth/sign_in.dart';
import 'package:shelter/ui/views/auth/sign_up.dart';
import 'package:shelter/ui/views/bottom_nav_controller/details_screen.dart';
import 'package:shelter/ui/views/bottom_nav_controller/pages/nav_add_last_step.dart';
import 'package:shelter/ui/views/bottom_nav_controller/search_screen.dart';
import 'package:shelter/ui/views/bottom_nav_controller/sell_all.dart';
import 'package:shelter/ui/views/drawer_pages/faq.dart';
import 'package:shelter/ui/views/drawer_pages/how_to_use.dart';
import 'package:shelter/ui/views/drawer_pages/privacy.dart';
import 'package:shelter/ui/views/drawer_pages/profile.dart';
import 'package:shelter/ui/views/drawer_pages/settings.dart';
import 'package:shelter/ui/views/drawer_pages/support.dart';
import 'package:shelter/ui/views/main_home_screen.dart';
import 'package:shelter/ui/views/onboarding_screen.dart';
import 'package:shelter/ui/views/privacy_policy.dart';
import 'package:shelter/ui/views/splash_screen.dart';
import 'package:shelter/ui/views/user_form.dart';

const String splash = '/splash-screen';
const String onboarding = '/onboarding-screen';
const String signUp = '/sign-up-screen';
const String signIn = '/sign-in-screen';
const String userForm = '/user-form-screen';
const String privacyPolicy = '/privacy-policy-screen';
const String mainHomeScreen = '/main-home-screen';
const String supportScreen = '/support-screen';
const String privacyScreen = '/privacy-screen';
const String faqScreen = '/faq-screen';
const String howToUseScreen = '/how-to-use-screen';
const String settingsScreen = '/settings-screen';
const String seeAllScreen = '/seeAll-screen';
const String detailsScreen = '/details-screen';
const String searchScreen = '/search-screen';
const String profileScreen = '/profile-screen';
const String navAddLastStep = '/navAddLastStep-screen';

//  control our page route flow

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: onboarding,
    page: () => OnboardingScreen(),
  ),
  GetPage(
    name: signUp,
    page: () => SignUp(),
  ),
  GetPage(
    name: signIn,
    page: () => SignIn(),
  ),
  GetPage(
    name: userForm,
    page: () => UserForm(),
  ),
  GetPage(
    name: privacyPolicy,
    page: () => PrivacyPolicy(),
  ),
  GetPage(
    name: mainHomeScreen,
    page: () => const MainHomeScreen(),
  ),
  GetPage(
    name: supportScreen,
    page: () => const Support(),
  ),
  GetPage(
    name: privacyScreen,
    page: () => Privacy(),
  ),
  GetPage(
    name: faqScreen,
    page: () => const FAQ(),
  ),
  GetPage(
    name: howToUseScreen,
    page: () => HowToUse(),
  ),
  GetPage(
    name: settingsScreen,
    page: () => Settings(),
  ),
  GetPage(
    name: seeAllScreen,
    page: () {
      SeeAll _seeAll = Get.arguments;
      return _seeAll;
    },
  ),
  GetPage(
    name: detailsScreen,
    page: () {
      DetailsSCreen _detailsSCreen = Get.arguments;
      return _detailsSCreen;
    },
  ),
  GetPage(
    name: searchScreen,
    page: () => const SearchScreen(),
  ),
  GetPage(
    name: profileScreen,
    page: () => UserProfile(),
  ),
  GetPage(
    name: navAddLastStep,
    page: () {
      NavAddLastStep _addLastStep = Get.arguments;
      return _addLastStep;
    },
  ),
];
