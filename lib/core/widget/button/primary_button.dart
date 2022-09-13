import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.buttonText, required this.onTap,  this.width}) : super(key: key);
 final String buttonText;
 final double? width;
 final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        onTap.call();
      },
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 2 / 3,
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.primaryColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textButtonColor),
          ),
        ),
      ),
    );
  }
}
