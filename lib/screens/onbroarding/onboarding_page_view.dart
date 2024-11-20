import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/routers/app_route_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../ultils/ultils/onbroarding_page_pos.dart';
import 'onboarding_child_page.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     checkVar();

  }

  void checkVar() async {
    final prefs = await SharedPreferences.getInstance();
    String? customer = prefs.getString('customer');
    String? init = prefs.getString('init');


// Kiểm tra các trường hợp của hai biến customer và init
    if (customer == null && init == null) {
      // Trường hợp cả customer và init đều null
      print('Cả customer và init đều không tồn tại trong SharedPreferences.');
    } else if (customer != null && init == null) {
      // Trường hợp chỉ có customer tồn tại, còn init là null
      print('Chỉ có customer tồn tại.');
    } else if (customer == null && init != null) {
      // Trường hợp chỉ có init tồn tại, còn customer là null
      print('Chỉ có init tồn tại.');
      context.pushReplacement('/login');
    } else {
      // Trường hợp cả customer và init đều tồn tại
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const MainApplication();
          },
        ),
      );

      print('Cả customer và init đều tồn tại.');
    }


  }

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingChildPage(
            onBoardingPos: OnBoardingPos.page1,
            nextOnPressed: () {
              _pageController.jumpToPage(1);
            },
            backOnPressed: () {
              // Add back button logic here if needed
            },
            skipOnPressed: () {
              _pageController.jumpToPage(2);
            },
          ),
          OnboardingChildPage(
            onBoardingPos: OnBoardingPos.page2,
            nextOnPressed: () {
              _pageController.jumpToPage(2);
            },
            backOnPressed: () {
              _pageController.jumpToPage(0);
            },
            skipOnPressed: () {
              _pageController.jumpToPage(2);
            },
          ),
          OnboardingChildPage(
            onBoardingPos: OnBoardingPos.page3,
            nextOnPressed: () {
              // Add next button logic here if needed
            },
            backOnPressed: () {
              _pageController.jumpToPage(1);
            },
            skipOnPressed: () {
            },
          ),
        ],

      ),
    );
  }


}
