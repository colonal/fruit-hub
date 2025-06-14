import 'package:e_commerce_app/core/services/firebase_auth_service.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/home/presentation/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../auth/presentation/view/signin_view.dart';
import '../../../../on_boarding/presentation/view/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(Assets.imagesPlant),
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeNavigation(BuildContext context) {
    final isViewOnBoarding = SharedPreferencesSingleton.getBool(
      kIsOnBoardingViewSeen,
    );
    Future.delayed(const Duration(seconds: 5), () {
      if (isViewOnBoarding) {
        var isLoggedIn = FirebaseAuthService.isLoggedIn;
        if (isLoggedIn && context.mounted) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else if (context.mounted) {
          Navigator.pushReplacementNamed(context, SignInView.routeName);
        }
      } else {
        if (context.mounted)
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
