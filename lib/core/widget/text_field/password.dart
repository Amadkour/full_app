import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget(
      {Key? key,
      required this.controller,
      required this.onChangeShowPassword,
      required this.showPassword})
      : super(key: key);
  final TextEditingController controller;
  final void Function() onChangeShowPassword;
  final bool showPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: 1,
      controller: controller,
      validator: (String? text) {
        if (text!.length > 8) {
          return null;
        } else {
          return 'enter a valid password';
        }
      },
      obscureText: showPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: 'Type Your Password',
        prefixIcon: const Icon(CupertinoIcons.lock),
        suffixIcon: IconButton(
          icon: Icon(showPassword ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye),
          onPressed: onChangeShowPassword,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.primaryColor, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(25)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.errorColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.errorColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
