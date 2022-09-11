import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  TextEditingController userController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController mailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  bool showPassword=true;

  onChangeShowPassword(){
    showPassword=!showPassword;
    emit(RegistrationInitial());
  }

  bool? agree=false;

  onChangeTermsAgreement(bool? v){
    agree=v;
    emit(RegistrationInitial());
  }

}
