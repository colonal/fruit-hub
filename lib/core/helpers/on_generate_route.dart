import 'package:flutter/material.dart';

import '../../features/auth/presentation/view/signin_view.dart';
import '../../features/auth/presentation/view/signup_view.dart';
import '../../features/best_selling_fruits/presentation/view/best_selling_view.dart';
import '../../features/checkout/presentation/view/checkout_view.dart';
import '../../features/home/domain/entites/cart_entity.dart';
import '../../features/home/presentation/view/main_view.dart';
import '../../features/on_boarding/presentation/view/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    case CheckoutView.routeName:
      return MaterialPageRoute(
        builder: (context) => CheckoutView(
          cart: settings.arguments as CartEntity,
        ),
      );
    default:
      return null;
  }
}
