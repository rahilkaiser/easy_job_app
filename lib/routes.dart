import 'package:easy_job_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:easy_job_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/widgets.dart';

import 'screens/splash_screen/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
};
