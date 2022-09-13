import 'package:api_project/core/theme/app_colors.dart';
import 'package:api_project/core/widget/text_field/mail.dart';
import 'package:api_project/modules/auth/forget/controller/forget_cubit.dart';
import 'package:api_project/modules/auth/login/controller/login_cubit.dart';
import 'package:api_project/modules/auth/registration/presention/page/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/button/primary_button.dart';
import '../../../../../core/widget/text_field/password.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetCubit(),
      child: BlocBuilder<ForgetCubit, ForgetState>(
        builder: (context, state) {
          ///-------------read page controller
          ForgetCubit controller = context.read<ForgetCubit>();

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
                  MailWidget(controller: controller.mailController),
                  const SizedBox(
                    height: 20,
                  ),

                  const Spacer(flex: 3,),
                  ///-----------button
                  PrimaryButton(buttonText: 'Confirm',
                    onTap: (){controller.onClickConfirmButton(context);},
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
