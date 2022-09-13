import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/config.dart';
import '../controller/settings_cubit.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(c)=>  gt<SettingsCubit>(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          SettingsCubit controller= context.read<SettingsCubit>();
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: () {
                controller.onChangeLang();
              },
                  child: Text(Config.localization['change_lang'])),
              TextButton(
                  onPressed: () {
                    controller.onChangedark();
                  },
                  child: Text(Config.localization['change_mode']))

            ],
          );
        },
      ),
    );
  }
}
