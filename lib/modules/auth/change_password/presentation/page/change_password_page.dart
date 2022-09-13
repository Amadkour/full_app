import 'package:api_project/core/theme/app_colors.dart';
import 'package:api_project/core/widget/text_field/mail.dart';
import 'package:api_project/modules/auth/change_password/controller/change_password_cubit.dart';
import 'package:api_project/modules/auth/login/controller/login_cubit.dart';
import 'package:api_project/modules/auth/registration/presention/page/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/button/primary_button.dart';
import '../../../../../core/widget/text_field/password.dart';
import '../../../forget/presentation/page/forget_page.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
        builder: (context, state) {
          ///-------------read page controller
          ChangePasswordCubit controller = context.read<ChangePasswordCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
              backgroundColor: AppColors.primaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Spacer(),
                  ///----------password text field
                  PasswordWidget(
                    controller: controller.passwordController,
                    showPassword: controller.showPassword,
                    onChangeShowPassword: controller.onChangeShowPassword,
                  ),                  const SizedBox(
                    height: 20,
                  ),
                  ///----------confirm password text field
                  PasswordWidget(
                    controller: controller.confirmPasswordController,
                    showPassword: controller.showPassword,
                    onChangeShowPassword: controller.onChangeShowPassword,
                  ),
                  const Spacer(flex: 3,),
                  ///-----------button
                  PrimaryButton(buttonText: 'Login',
                    onTap: (){controller.onClickButton(context);},
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
