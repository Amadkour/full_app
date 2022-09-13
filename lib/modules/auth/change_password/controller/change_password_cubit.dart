import 'package:api_project/modules/auth/login/presention/page/login_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();

  bool showPassword=true;

  onChangeShowPassword(){
    showPassword=!showPassword;
    emit(ChangePasswordInitial());
  }

  void onClickButton(BuildContext context) {

    if(passwordController.text==confirmPasswordController.text){

      ///-------------////
      Navigator.push (
        context,
        MaterialPageRoute (
          builder: (BuildContext context) => const LoginPage(),
        ),
      );
    }


  }


}
