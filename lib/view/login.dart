import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lana_inventory/controller/login_controller.dart';
import 'package:lana_inventory/helper/app.dart';

class Login extends StatelessWidget {

  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App.background,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Obx(() => loginController.loading.value
            ?Center(
          child: CircularProgressIndicator(),
        )
            :SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,),

              Container(
                width: 250,
                height: 170,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/logo.png",),fit: BoxFit.contain)
                ),
              ),
              SizedBox(height: 40,),
              Container(
                width: Get.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                    color: App.backgroundLight,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: TextField(
                  controller: loginController.username,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person_outline,color: Colors.white,),
                    labelText: "اسم المستخدم",
                    labelStyle: TextStyle(color: Colors.white,height: 0.5),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: Get.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                    color: App.backgroundLight,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: TextField(
                  controller: loginController.password,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_outline,color: Colors.white,),
                    labelText: "كلمة المرور",
                    labelStyle: TextStyle(color: Colors.white,height: 0.5),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  loginController.login(context);
                },
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: App.primary,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text("تسجيل الدخول",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
              SizedBox(height: 50,),
            ],
          ),
        )),
      ),
    );
  }
}
