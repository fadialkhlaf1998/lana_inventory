import 'package:get/get.dart';
import 'package:lana_inventory/controller/login_controller.dart';
import 'package:lana_inventory/helper/global.dart';
import 'package:lana_inventory/helper/store.dart';
import 'package:lana_inventory/view/login.dart';

class IntroController extends GetxController{

  LoginController loginController = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData()async{
    await Future.delayed(Duration(milliseconds: 800));
    Global.loginInfo = await Store.loadLoginInfo();
    if(Global.loginInfo == null){
      Get.offAll(Login());
    }else{
      loginController.autoLogin(Global.loginInfo!.username, Global.loginInfo!.password);
    }
  }
}