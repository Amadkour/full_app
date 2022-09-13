import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../dashboard/presentation/page/dashboard_page.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController mailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

 bool showPassword=true;

 onChangeShowPassword(){
   showPassword=!showPassword;
   emit(LoginInitial());
 }


 onClickButton(BuildContext context){
   Navigator.push (
     context,
     MaterialPageRoute (
       builder: (BuildContext context) => const DashboardPage(),
     ),
   );
 }


}
