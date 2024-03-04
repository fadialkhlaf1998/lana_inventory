import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class App{
  static Color primary = Color(0xff941880);
  static Color gold = Color(0xffd6ae2d);
  static Color background = Color(0xff201a30);
  static Color backgroundLight = Color(0xff38304c);
  static Color grey = Color(0xffd9d0d5);

  static String getDateTime(DateTime dateTime){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('HH:mm').format(now);

    print('Formatted Date: $formattedDate'); // Output: Formatted Date: 2024-02-23
    print('Formatted Time: $formattedTime'); // Output: Formatted Time: 12:34:56
    return formattedDate+" "+formattedTime;
  }
  static String getDate(DateTime dateTime){
    // DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    String formattedTime = DateFormat('HH:mm').format(dateTime);

    print('Formatted Date: $formattedDate'); // Output: Formatted Date: 2024-02-23
    print('Formatted Time: $formattedTime'); // Output: Formatted Time: 12:34:56
    return formattedDate;
  }
  static String getTime(DateTime dateTime){
    // DateTime now = DateTime.parse(dateTime);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    String formattedTime = DateFormat('HH:mm').format(dateTime);

    print('Formatted Date: $formattedDate'); // Output: Formatted Date: 2024-02-23
    print('Formatted Time: $formattedTime'); // Output: Formatted Time: 12:34:56
    return formattedTime;
  }

  static msg(String title,BuildContext context){
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        backgroundColor: App.backgroundLight,
        message:
        title,
      ),
    );
    // AnimatedSnackBar.material(
    //   title,
    //   type: AnimatedSnackBarType.info,
    // ).show(context);
    // Get.snackbar(
    //   title,
    //   msg,
    //   colorText: Colors.white,
    //   backgroundColor: App.backgroundLight,
    //   icon: Icon(iconData,color:Colors.white),
    // );
  }
}