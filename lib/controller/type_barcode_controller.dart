import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:lana_inventory/helper/api.dart';
import 'package:lana_inventory/helper/app.dart';
import 'package:lana_inventory/model/product.dart';
import 'package:lana_inventory/view/add_product.dart';
import 'package:lana_inventory/view/edit_qty.dart';
import 'package:lana_inventory/view/home.dart';

class TypeBarcodeController extends GetxController{

  RxBool loading = false.obs;

  TextEditingController barcode = TextEditingController();
  searchTypedCode(BuildContext context)async{
    if(
    barcode.text.isNotEmpty){
      searchBarcode(barcode.text, context);
    }
  }
  Future<bool> searchBarcode(String code,BuildContext context)async{
    print(code);
    loading(true);
    barcode.clear();
    List<Product>? products = await Api.searchByBarcode(code);
    if(products == null){
      App.msg( "حدث خطأ الرجاء المحاولة مرة أخرى", context);
      loading(false);
      return false;
    }else if(products.isEmpty){

      Get.to(AddProduct());
      loading(false);
      App.msg("المنتج غير موجود", context);
      return false;
    }else{
      Get.to(EditQty(products[0]));
      loading(false);
      return true;
    }
  }

}