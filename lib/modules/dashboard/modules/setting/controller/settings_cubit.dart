import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/config.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool isDark=false;

  onChangedark(){
    isDark=!isDark;
    emit(SettingsInitial());
  }

  onChangeLang() async {
    SharedPreferences s =await SharedPreferences.getInstance();
    String lang=s.getString('lang')??'ar';

    if(lang=='ar'){
      s.setString('lang', 'en');
      Config.loadLanguage('en');
    }else{
      s.setString('lang', 'ar');
      Config.loadLanguage('ar');
    }

    emit(SettingsInitial());

  }

}
