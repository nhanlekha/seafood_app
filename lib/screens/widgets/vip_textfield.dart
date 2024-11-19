import 'package:flutter/material.dart';
import 'package:seafood_app/constants.dart';

class VipTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String obscureCharacter;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  const VipTextField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.obscureCharacter = '*',
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.065,
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        obscuringCharacter: obscureCharacter,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryLightColor,
            ),
          ),
          prefixIcon: prefixIcon ??
              const Icon(
                Icons.person,
                color: kPrimaryColor,
              ),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: kPrimaryLightColor,
          labelText: hintText ?? "Nhập thông tin",
          labelStyle: const TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }
}