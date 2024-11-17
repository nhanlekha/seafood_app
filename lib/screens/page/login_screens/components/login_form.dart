import 'package:flutter/material.dart';
import 'package:seafood_app/screens/page/signup_screens/signup_screen.dart';
import 'package:seafood_app/screens/widgets/vip_textfield.dart';

import '../../../../components/already_have_an_account_acheck.dart';
import '../../../../constants.dart';
import '../../../widgets/vip_button.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          VipTextField(
            controller: TextEditingController(),
            hintText: "Email",
            prefixIcon: const Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            suffixIcon: null,
          ),
          VipTextField(
            controller: TextEditingController(),
            hintText: "Mật khẩu",
            prefixIcon: const Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            suffixIcon: const Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(height: defaultPadding),
          VipButton(
            text: "ĐĂNG NHẬP",
            onPressed: () {},
            backgroundColor: kPrimaryColor,
            icon: Icons.login,
            textColor: Colors.white,
            borderRadius: 10,
            isFullWidth: true,
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreens();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
