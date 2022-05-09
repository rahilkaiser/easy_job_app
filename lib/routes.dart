import 'package:easy_job_app/screens/chat/chat_room_screen/chat_room_screen.dart';
import 'package:easy_job_app/screens/create_job/create_job_screen.dart';
import 'package:easy_job_app/screens/home_screen/home_screen.dart';
import 'package:easy_job_app/screens/map/map_screen.dart';
import 'package:easy_job_app/screens/search_screen/components/filter_search_field.dart';

import 'package:easy_job_app/screens/search_screen/filter_result_screen.dart';
import 'package:flutter/widgets.dart';

import 'screens/auth/complete_profile_screen/complete_profile_screen.dart';
import 'screens/auth/forgot_password_screen/forgot_password_screen.dart';
import 'screens/auth/login_success_screen/login_success_screen.dart';
import 'screens/auth/otp_screen/otp_screen.dart';
import 'screens/auth/sign_in_screen/sign_in_screen.dart';
import 'screens/auth/sign_up_screen/sign_up_screen.dart';
import 'screens/auth/splash_screen/splash_screen.dart';

import 'screens/chat/chat_list_screen/chat_list_screen.dart';
import 'screens/filter/filter_screen.dart';
import 'screens/profile_screen/profile_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  FilterScreenResult.routeName: (context) => FilterScreenResult(),
  FilterSearchField.routeName: (context) => FilterSearchField(),
  ChatListScreen.routeName: (context) => ChatListScreen(),
  MessagesScreen.routeName: (context) => MessagesScreen(),
  FilterScreen.routeName: (context) => FilterScreen(),
  MapScreen.routeName: (context) => MapScreen(),
  CreateJobScreen.routeName: (context) => CreateJobScreen(),
};
