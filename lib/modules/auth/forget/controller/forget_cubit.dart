import 'package:api_project/modules/auth/pin_code/presentation/page/pin_code_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'forget_state.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(ForgetInitial());

  TextEditingController mailController=TextEditingController();



  onClickConfirmButton( BuildContext context ){

    if(mailController.text.isNotEmpty){

      Navigator.push (
        context,
        MaterialPageRoute (
          builder: (BuildContext context) => const PinCodePage(),
        ),
      );

    }
  }

}
