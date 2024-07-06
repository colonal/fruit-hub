import 'package:flutter/material.dart';

import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/signup_view.dart';
import '../../features/on_boarding/presentation/view/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    default:
      return null;
  }
}
