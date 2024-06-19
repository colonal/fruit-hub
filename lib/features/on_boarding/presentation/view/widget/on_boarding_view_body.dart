import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/view/login_view.dart';
import '../../../../../services/shared_preferences_singleton.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  late ValueNotifier<int> currentPage;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    currentPage = ValueNotifier(0);
    pageController.addListener(() {
      currentPage.value = pageController.page!.round();
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        ValueListenableBuilder(
            valueListenable: currentPage,
            child: const SizedBox(height: 29),
            builder: (context, value, child) {
              return Column(
                children: [
                  DotsIndicator(
                    dotsCount: 2,
                    decorator: DotsDecorator(
                      activeColor: AppColors.primaryColor,
                      color: value == 1
                          ? AppColors.primaryColor
                          : AppColors.primaryColor.withOpacity(.5),
                    ),
                  ),
                  child!,
                  Visibility(
                    visible: value == 1,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kHorizontalPadding),
                      child: CustomButton(
                        text: "ابدأ الان",
                        onPressed: () {
                          SharedPreferencesSingleton.setBool(
                            kIsOnBoardingViewSeen,
                            true,
                          );
                          Navigator.of(context)
                              .pushReplacementNamed(LoginView.routeName);
                        },
                      ),
                    ),
                  ),
                ],
              );
            }),
        const SizedBox(height: 43),
      ],
    );
  }
}
