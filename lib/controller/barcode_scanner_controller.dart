// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lana_inventory/helper/api.dart';
import 'package:lana_inventory/helper/app.dart';
import 'package:lana_inventory/model/product.dart';
import 'package:lana_inventory/view/add_product.dart';
import 'package:lana_inventory/view/edit_qty.dart';

class BarcodeScannerController extends GetxController{


  Future<bool> searchBarcode(String code,BuildContext context)async{
    print(code);
    List<Product>? products = await Api.searchByBarcode(code);
    if(products == null){
      App.msg( "حدث خطأ الرجاء المحاولة مرة أخرى", context);
      return false;
    }else if(products.isEmpty){

      Get.off(AddProduct());
      // await Future.delayed(Duration(milliseconds: 1500));
      App.msg("المنتج غير موجود", context);
      return false;
    }else{
      Get.off(EditQty(products[0]));
      return true;
    }
  }
}