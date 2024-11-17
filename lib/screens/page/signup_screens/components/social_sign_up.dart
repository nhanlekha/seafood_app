import 'package:flutter/material.dart';
import 'package:seafood_app/screens/page/signup_screens/components/or_divider.dart';
import 'package:seafood_app/screens/page/signup_screens/components/social_icon.dart';


class SocailSignUp extends StatelessWidget {
  const SocailSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocialIcon(
              iconSrc: "assets/icons/facebook.svg",
              press: () {},
            ),
            SocialIcon(
              iconSrc: "assets/icons/twitter.svg",

              press: () {},

            ),
            SocialIcon(
              iconSrc: "assets/icons/google-plus.svg",
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}