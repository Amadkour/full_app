import 'package:api_project/core/theme/app_colors.dart';
import 'package:api_project/core/widget/text_field/mail.dart';
import 'package:api_project/modules/auth/login/controller/login_cubit.dart';
import 'package:api_project/modules/auth/registration/presention/page/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/button/primary_button.dart';
import '../../../../../core/widget/text_field/password.dart';
import '../../../forget/presentation/page/forget_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          ///-------------read page controller
          LoginCubit controller = context.read<LoginCubit>();

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
                  ///----------mail text field
                  MailWidget(controller: controller.mailController),
                  const SizedBox(
                    height: 20,
                  ),
                  ///----------password text field
                  PasswordWidget(
                    controller: controller.passwordController,
                    showPassword: controller.showPassword,
                    onChangeShowPassword: controller.onChangeShowPassword,
                  ),
                  const Spacer(flex: 3,),
                  ///-----------button
                  PrimaryButton(buttonText: 'Login',
                    onTap: (){controller.onClickButton(context);},
                  ),
                  Spacer(),
                  ///-------------forget and sing up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///-------------forget
                      PrimaryButton(
                        buttonText: 'Forget',
                        onTap:(){
                          Navigator.push (
                            context,
                            MaterialPageRoute (
                              builder: (BuildContext context) => const ForgetPage(),
                            ),
                          );
                        },
                        width: MediaQuery.of(context).size.width/3,
                      ),
                      const SizedBox(width: 10,),
                      ///-------------sing up
                      PrimaryButton(buttonText: 'Sign Up',
                        onTap:(){
                          Navigator.push (
                            context,
                            MaterialPageRoute (
                              builder: (BuildContext context) => const RegistrationPage(),
                            ),
                          );
                        },
                        width: MediaQuery.of(context).size.width/3,

                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
