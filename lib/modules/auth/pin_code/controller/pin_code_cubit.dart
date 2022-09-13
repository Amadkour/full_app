import 'package:api_project/modules/auth/change_password/presentation/page/change_password_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'pin_code_state.dart';

class PinCodeCubit extends Cubit<PinCodeState> {
  PinCodeCubit() : super(PinCodeInitial());

  TextEditingController codeController=TextEditingController();

  void onClickConfirmButton(BuildContext context) {

    if(codeController.text=='1223'){

      Navigator.push (
        context,
        MaterialPageRoute (
          builder: (BuildContext context) => const ChangePasswordPage(),
        ),
      );

    }

  }




}
