import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/constants.dart';
import 'package:seafood_app/routers/app_route_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ultils/ultils/onbroarding_page_pos.dart';
import '../page/login_screens/login_screens.dart';

class OnboardingChildPage extends StatelessWidget {
  final OnBoardingPos onBoardingPos;
  final VoidCallback nextOnPressed;
  final VoidCallback backOnPressed;
  final VoidCallback skipOnPressed;

  const OnboardingChildPage(
      {super.key,
      required this.onBoardingPos,
      required this.nextOnPressed,
      required this.backOnPressed,
      required this.skipOnPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // _buildSkipButton(),
                _buildOnboardingImage(),
                _buildOnboardingPageControl(),
                _buildOnboardingTitleContent(),
                _buildOnboardingNextAndPrevButton(context),
              ],
            ),
          ),
        ));
  }

  Widget _buildSkipButton() {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      margin: const EdgeInsets.only(top: 14),
      child: TextButton(
          onPressed: () {},
          child: TextButton(
            onPressed: () {
              skipOnPressed.call();
            },
            child: const Text(
              "Bỏ qua",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Lato",
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          )),
    );
  }

  Widget _buildOnboardingImage() {
    return Image.asset(
      onBoardingPos.onBoardingPageImage(),
      width: 296,
      height: 271,
      fit: BoxFit.contain,
    );
  }

  Widget _buildOnboardingPageControl() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: 26,
            decoration: BoxDecoration(
              color: onBoardingPos == OnBoardingPos.page1
                  ? Colors.white
                  : Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(56),
            ),
          ),
          Container(
            height: 4,
            width: 26,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: onBoardingPos == OnBoardingPos.page2
                  ? Colors.white
                  : Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(56),
            ),
          ),
          Container(
            height: 4,
            width: 26,
            decoration: BoxDecoration(
              color: onBoardingPos == OnBoardingPos.page3
                  ? Colors.white
                  : Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(56),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingTitleContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            onBoardingPos.onBoardingPageTitle(),
            style: TextStyle(
              color: Colors.black.withOpacity(0.87),
              fontFamily: "Lato",
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 42),
          Text(
            onBoardingPos.onBoardingPageContent(),
            style: TextStyle(
              color: Colors.black.withOpacity(0.87),
              fontFamily: "Lato",
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingNextAndPrevButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          TextButton(
              onPressed: () {
                backOnPressed.call();
              },
              child: Text(
                "Quay lại",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.44),
                  fontFamily: "Lato",
                  fontSize: 16,
                ),
              )),
          const Spacer(),
          ElevatedButton(
              onPressed: () async  {
                nextOnPressed.call();
                if(onBoardingPos == OnBoardingPos.page3){

                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('init', 'true');
                  context.push('/login');
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: kOrangeColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              child: Text(
                onBoardingPos == OnBoardingPos.page3 ? "Bắt đầu" : "Tiếp",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Lato",
                  fontSize: 16,
                ),
              )),
        ],
      ),
    );
  }
}
