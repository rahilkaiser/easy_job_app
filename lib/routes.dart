import 'package:easy_job_app/screens/home_screen/home_screen.dart';
import 'package:easy_job_app/screens/login_success_screen/login_success_screen.dart';
import 'package:easy_job_app/screens/otp_screen/otp_screen.dart';
import 'package:easy_job_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:easy_job_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/widgets.dart';

import 'screens/complete_profile_screen/complete_profile_screen.dart';
import 'screens/forgot_password_screen/forgot_password_screen.dart';
import 'screens/splash_screen/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
};
