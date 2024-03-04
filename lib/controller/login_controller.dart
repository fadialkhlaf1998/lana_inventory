import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:lana_inventory/helper/api.dart';
import 'package:lana_inventory/helper/app.dart';
import 'package:lana_inventory/helper/global.dart';
import 'package:lana_inventory/helper/store.dart';
import 'package:lana_inventory/model/user.dart';
import 'package:lana_inventory/view/barcode_scanner.dart';
import 'package:lana_inventory/view/home.dart';
import 'package:lana_inventory/view/login.dart';
// import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class LoginController extends GetxController{

  RxBool loading = false.obs;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  login(BuildContext context)async{
    if(username.text.isEmpty){
      App.msg("اسم المستخدم مطلوب", context);
    }else if(password.text.isEmpty){
      App.msg("كلمة المرور مطلوبة", context);
    }else{
      loading(true);
      List<User> users = await Api.login(username.text, password.text);
      if(users.length == 0){
        App.msg( "خطأ في تسجيل الدخول", context);
      }else{
        Global.user = users[0];
        Store.saveLoginInfo(username.text, password.text);
        Get.offAll(Home());
      }
      loading(false);
    }
  }

  autoLogin(String username,String password)async{
    List<User> users = await Api.login(username, password);
    if(users.length == 0){
      Get.offAll(Login());
    }else{
      Global.user = users[0];
      Store.saveLoginInfo(username, password);
      Get.offAll(Home());
    }
  }

}