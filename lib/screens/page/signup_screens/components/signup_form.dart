import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/screens/page/order_screens/order_screens.dart';
import 'package:seafood_app/screens/page/signup_screens/components/social_sign_up.dart';
import 'package:seafood_app/screens/widgets/vip_textfield.dart';

import '../../../../components/already_have_an_account_acheck.dart';
import '../../../../constants.dart';
import '../../../../domans/repo/impl/auth_repo_impl.dart';
import '../../../../model/customer_model.dart';
import '../../../widgets/toast_widget.dart';
import '../../../widgets/vip_button.dart';
import '../../login_screens/login_screens.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // Khai báo các controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Đừng quên giải phóng controller khi không sử dụng nữa
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          VipTextField(
            controller: nameController,
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
            controller: emailController,
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
            controller: phoneController,
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
          const SizedBox(height: defaultPadding / 2),
          VipButton(
            text: "ĐĂNG KÝ",
            onPressed: () async {
              final _auth = context.read<AuthRepoImpl>();

              // Lấy giá trị từ các controller khi người dùng bấm Đăng Ký
              String name = nameController.text;
              String email = emailController.text;
              String phone = phoneController.text;
              String password = passwordController.text;

              // Kiểm tra các giá trị (bạn có thể thêm kiểm tra dữ liệu hợp lệ ở đây)
              if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
                showToast(message: 'Vui lòng điền đầy đủ thông tin!');
              } else {
                CustomerModel? customer =  await _auth.register(customerEmail: email, customerPassword: password, customerName: name, customerPhone: phone);
                if (customer != null) {
                  // Thực hiện hành động đăng ký
                  showToast(message: 'Đăng ký thành công !');
                  // Điều hướng đến màn hình login sau khi đăng ký thành công
                  context.push('/login');

                } else {
                  print('Customer is null');
                  showToast(message: 'Đăng ký thất bại !');
                }


              }
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
