import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seafood_app/screens/page/signup_screens/components/social_sign_up.dart';
import 'package:seafood_app/screens/widgets/vip_textfield.dart';

import '../../../../components/already_have_an_account_acheck.dart';
import '../../../../constants.dart';
import '../../../widgets/toast_widget.dart';
import '../../../widgets/vip_button.dart';
import '../../login_screens/login_screens.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          VipTextField(
            controller: TextEditingController(),
            hintText: "Họ và tên",
            prefixIcon: const Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            keyboardType: TextInputType.text,
            obscureText: false,
            suffixIcon: null,
          ),
          VipTextField(
            controller: TextEditingController(),
            hintText: "Email",
            prefixIcon: const Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            suffixIcon: null,
          ),
          VipTextField(
            controller: TextEditingController(),
            hintText: "Điện thoại",
            prefixIcon: const Icon(
              Icons.phone,
              color: kPrimaryColor,
            ),
            keyboardType: TextInputType.phone,
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
          const SizedBox(height: defaultPadding / 2),
          VipButton(
            text: "ĐĂNG KÝ",
            onPressed: () {
              showToast(message: 'Đăng ký thành công !');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreens();
                  },
                ),
              );
            },
            backgroundColor: kPrimaryColor,
            icon: Icons.arrow_forward,
            textColor: Colors.white,
            borderRadius: 10,
            isFullWidth: true,
          ),

          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreens();
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
