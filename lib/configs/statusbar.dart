import 'package:carrental/configs/colors_constant.dart';
import 'package:carrental/utils/helper.dart';
import 'package:flutter/services.dart';

class Statusbar {


  void trasparentStatusbar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            isDarkMode() ? Brightness.light : Brightness.dark,
        statusBarColor: isDarkMode() ? darkBackgroundColor : transparent,
        statusBarBrightness: isDarkMode() ? Brightness.dark : Brightness.light,
      ),
    );
  }

  
}
