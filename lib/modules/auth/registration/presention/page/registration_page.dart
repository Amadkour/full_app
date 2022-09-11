import 'package:api_project/core/theme/app_colors.dart';
import 'package:api_project/core/widget/text_field/mail.dart';
import 'package:api_project/modules/auth/login/controller/login_cubit.dart';
import 'package:api_project/modules/auth/registration/controller/registration_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/text_field/password.dart';
import '../../../../../core/widget/text_field/phone.dart';
import '../../../../../core/widget/text_field/userName.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(),
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          ///-------------read page controller
          RegistrationCubit controller = context.read<RegistrationCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
              backgroundColor: AppColors.primaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height-200,
                    child: Column(
                      children: [
                        UserNameWidget(controller: controller.userController),
                        const SizedBox(
                          height: 20,
                        ),
                        PhoneWidget(controller: controller.phoneController),
                        const SizedBox(
                          height: 20,
                        ),
                        MailWidget(controller: controller.mailController),
                        const SizedBox(
                          height: 20,
                        ),
                        PasswordWidget(
                          controller: controller.passwordController,
                          showPassword: controller.showPassword,
                          onChangeShowPassword: controller.onChangeShowPassword,
                        ),


                        CheckboxListTile(
                            value: controller.agree,
                          onChanged: controller.onChangeTermsAgreement,
                          title: const Text('Terms And Conditions'),
                          activeColor: AppColors.primaryColor,
                      controlAffinity: ListTileControlAffinity.leading,
                        ),

                        const Spacer(
                          flex: 3,
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width * 2 / 3,
                          height: 50,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor, borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textButtonColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
