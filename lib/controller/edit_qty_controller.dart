import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:lana_inventory/helper/api.dart';
import 'package:lana_inventory/helper/app.dart';
import 'package:lana_inventory/model/product.dart';
import 'package:lana_inventory/view/home.dart';

class EditQtyController extends GetxController{

  RxBool loading = false.obs;
  RxBool successfully = false.obs;

  TextEditingController qty = TextEditingController();
  Product? product;
  editProductQty(BuildContext context)async{
    successfully(false);
    if(
        qty.text.isNotEmpty &&
        product != null){
      loading(true);
      bool succ = await Api.editQty(double.parse(qty.text),product!.productId);
      if(succ){
        successfully(true);
        await Future.delayed(Duration(milliseconds: 1500));
        Get.offAll(Home());
      }else{
        App.msg("خطأ في تعديل الكمية",context);
      }
    }


    loading(false);
  }


}