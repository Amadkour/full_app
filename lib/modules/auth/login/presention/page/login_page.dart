import 'package:api_project/core/theme/app_colors.dart';
import 'package:api_project/core/widget/text_field/mail.dart';
import 'package:api_project/modules/auth/login/controller/login_cubit.dart';
import 'package:api_project/modules/auth/registration/presention/page/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/text_field/password.dart';

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
                  Spacer(),
                  MailWidget(controller: controller.mailController),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordWidget(
                    controller: controller.passwordController,
                    showPassword: controller.showPassword,
                    onChangeShowPassword: controller.onChangeShowPassword,
                  ),
                  Spacer(flex: 3,),
                  Container(
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor, borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textButtonColor),
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1 / 3,
                        height: 50,
                        decoration: BoxDecoration(
                            color: AppColors.enableColor, borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            'Forget',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textButtonColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          Navigator.push (
                            context,
                            MaterialPageRoute (
                              builder: (BuildContext context) => const RegistrationPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1 / 3,
                          height: 50,
                          decoration: BoxDecoration(
                              color: AppColors.enableColor, borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textButtonColor),
                            ),
                          ),
                        ),
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
