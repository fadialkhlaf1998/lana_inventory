import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lana_inventory/controller/intro_controller.dart';
import 'package:lana_inventory/helper/app.dart';

class Intro extends StatelessWidget {
  IntroController introController = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App.background,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
