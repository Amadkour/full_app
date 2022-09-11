import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_colors.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({Key? key, required this.controller}) : super(key: key);
   final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: 1,
      controller: controller,
      validator: (String? text) {
        if ((text ?? '').length==9) {
          return null;
        } else {
          return 'enter a valid Phone';
        }
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: 'Type Your Phone',
        prefixIcon: const Icon(Icons.phone_iphone),
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
