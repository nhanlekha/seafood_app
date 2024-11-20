import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/app/app_cubit.dart';
import 'package:seafood_app/main.dart';
import 'package:seafood_app/model/customer_model.dart';
import 'package:seafood_app/routers/app_route_config.dart';
import 'package:seafood_app/screens/page/main_screens/main_screens.dart';
import 'package:seafood_app/screens/page/signup_screens/signup_screen.dart';
import 'package:seafood_app/screens/widgets/toast_widget.dart';
import 'package:seafood_app/screens/widgets/vip_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../components/already_have_an_account_acheck.dart';
import '../../../../constants.dart';
import '../../../../domans/repo/impl/auth_repo_impl.dart';
import '../../../widgets/vip_button.dart';

class LoginForm extends StatelessWidget {
  // Khai báo controller để quản lý giá trị nhập liệu
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Trường nhập email
          VipTextField(
            initialText: 'nhanlekha@gmail.com',
            controller: emailController,
            hintText: "Email",
            prefixIcon: const Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            suffixIcon: null,
          ),
          // Trường nhập mật khẩu
          VipTextField(
            initialText: '123456',
            controller: passwordController,
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
          // Nút đăng nhập
          VipButton(
            text: "ĐĂNG NHẬP",
            onPressed: () async {
              final _auth = context.read<AuthRepoImpl>();
              final email = emailController.text.trim(); // Lấy giá trị email
              final password = passwordController.text.trim(); // Lấy giá trị mật khẩu

              try {
               CustomerModel? customer =  await _auth.fetchData(email, password);
               if (customer != null) {
                 print('customer: ${customer.customerId}');
               } else {
                 print('Customer is null');
               }


                if (customer != null) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('customer', customer.convertToJson());

                  //
                  // String? json = prefs.getString('customer');
                  // CustomerModel? currentCustomer = CustomerModel.parseCustomerFromJson(json);
                  // print('haaha: ${currentCustomer?.customerId}');


                  showToast(message: 'Đăng nhập thành công!');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MainApplication();
                      },
                    ),
                  );

                } else {
                  showToast(message: 'Đăng nhập thất bại. Vui lòng thử lại.');
                }
              } catch (e) {
                showToast(message: 'Có lỗi xảy ra: $e');
              }
            },
            backgroundColor: kPrimaryColor,
            icon: Icons.login,
            textColor: Colors.white,
            borderRadius: 10,
            isFullWidth: true,
          ),
          const SizedBox(height: defaultPadding),
          // Chuyển đến màn hình đăng ký
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
