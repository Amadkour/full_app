import 'package:api_project/core/theme/app_colors.dart';
import 'package:api_project/core/widget/text_field/mail.dart';
import 'package:api_project/modules/auth/forget/controller/forget_cubit.dart';
import 'package:api_project/modules/auth/login/controller/login_cubit.dart';
import 'package:api_project/modules/auth/pin_code/controller/pin_code_cubit.dart';
import 'package:api_project/modules/auth/registration/presention/page/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/widget/button/primary_button.dart';
import '../../../../../core/widget/text_field/password.dart';

class PinCodePage extends StatelessWidget {
  const PinCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PinCodeCubit(),
      child: BlocBuilder<PinCodeCubit, PinCodeState>(
        builder: (context, state) {
          ///-------------read page controller
          PinCodeCubit controller = context.read<PinCodeCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Enter Your Email'),
              backgroundColor: AppColors.primaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Spacer(),
                  ///----------mail text field
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      selectedFillColor:AppColors.primaryColor.withAlpha(100),
                      inactiveFillColor: AppColors.primaryColor,
                      shape: PinCodeFieldShape.circle,
                      // borderRadius: BorderRadius.circular(5),
                      fieldHeight: MediaQuery.of(context).size.width/5,
                      fieldWidth: MediaQuery.of(context).size.width/5,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),

                    backgroundColor: Colors.transparent,

                    enableActiveFill: true,
                    controller: controller.codeController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {

                    },

                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Spacer(flex: 3,),
                  ///-----------button
                  PrimaryButton(buttonText: 'Confirm',
                    onTap: (){

                    controller.onClickConfirmButton(context);

                    },
                  ),
                  Spacer(),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
