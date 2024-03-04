import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:lana_inventory/helper/api.dart';
import 'package:lana_inventory/helper/app.dart';
import 'package:lana_inventory/view/home.dart';

class AddProductController extends GetxController{

  RxBool loading = false.obs;
  RxBool successfully = false.obs;

  TextEditingController itemId = TextEditingController();
  TextEditingController barcode = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController VK_netto = TextEditingController();
  TextEditingController VK_brutto = TextEditingController();
  TextEditingController Warenwert_VK_netto = TextEditingController();
  TextEditingController Warenwert_VK_brutto = TextEditingController();
  TextEditingController EK_netto = TextEditingController();
  TextEditingController EK_brutto = TextEditingController();
  TextEditingController EK_Summe_netto = TextEditingController();
  TextEditingController EK_Summe_brutto = TextEditingController();

  addProduct(BuildContext context)async{
    successfully(false);
    if(barcode.text.isNotEmpty &&
        title.text.isNotEmpty &&
        qty.text.isNotEmpty &&
        VK_netto.text.isNotEmpty &&
        VK_brutto.text.isNotEmpty &&
        Warenwert_VK_netto.text.isNotEmpty &&
        Warenwert_VK_brutto.text.isNotEmpty &&
        EK_netto.text.isNotEmpty &&
        EK_brutto.text.isNotEmpty &&
        EK_Summe_netto.text.isNotEmpty &&
        EK_Summe_brutto.text.isNotEmpty){
      loading(true);
      bool succ = await Api.addProduct(itemId.text, barcode.text, title.text,
          double.parse(qty.text),double.parse(VK_netto.text), double.parse(VK_brutto.text),
          double.parse(Warenwert_VK_netto.text),
          double.parse(Warenwert_VK_brutto.text), double.parse(EK_netto.text),
          double.parse(EK_brutto.text), double.parse(EK_Summe_netto.text),
          double.parse(EK_Summe_brutto.text));
      if(succ){
        successfully(true);
        await Future.delayed(Duration(milliseconds: 1500));
        Get.offAll(Home());
      }else{
        App.msg("خطأ في إضافة المنتج", context);
      }
    }


    loading(false);
  }

  calc(){
    double VK_netto_double = double.parse(VK_netto.text.isEmpty?"0":VK_netto.text);
    double qty_double = double.parse(qty.text.isEmpty?"0":qty.text);
    double VK_brutto_double = double.parse(VK_brutto.text.isEmpty?"0":VK_brutto.text);
    double EK_netto_double = double.parse(EK_netto.text.isEmpty?"0":EK_netto.text);
    double EK_brutto_double = double.parse(EK_brutto.text.isEmpty?"0":EK_brutto.text);
    print(VK_brutto_double);
    Warenwert_VK_netto.text = (qty_double * VK_netto_double).toString();
    Warenwert_VK_brutto.text = (qty_double * VK_brutto_double).toString();
    EK_Summe_netto.text = (qty_double * EK_netto_double).toString();
    EK_Summe_brutto.text = (qty_double * EK_brutto_double).toString();
  }

}