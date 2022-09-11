import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({Key? key, required this.controller}) : super(key: key);
   final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: 1,
      controller: controller,
      validator: (String? text) {
        if ((text ?? '').length>=10) {
          return null;
        } else {
          return 'enter a valid Full Name';
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: 'Type Your Full Name',
        prefixIcon: const Icon(CupertinoIcons.person),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.primaryColor, width: 2, style: BorderStyle.solid),
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
