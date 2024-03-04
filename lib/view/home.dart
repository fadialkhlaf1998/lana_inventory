import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lana_inventory/controller/home_controller.dart';
import 'package:lana_inventory/helper/api.dart';
import 'package:lana_inventory/helper/app.dart';
import 'package:lana_inventory/helper/global.dart';
import 'package:lana_inventory/helper/store.dart';
import 'package:lana_inventory/model/product.dart';
import 'package:lana_inventory/view/add_product.dart';
import 'package:lana_inventory/view/barcode_scanner.dart';
import 'package:lana_inventory/view/edit_qty.dart';
import 'package:lana_inventory/view/login.dart';
import 'package:lana_inventory/view/type_barcode.dart';

class Home extends StatelessWidget {
  // HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App.background,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                width: Get.width*0.9,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Global.user!.name,style: TextStyle(color: App.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                    Row(
                      children: [
                        Text(Global.user!.appData.createdAt==null?"":App.getTime(Global.user!.appData.createdAt!),style: TextStyle(color: App.grey),),
                        SizedBox(width: 8,),
                        Text(Global.user!.appData.createdAt==null?"":App.getDate(Global.user!.appData.createdAt!),style: TextStyle(color: App.gold),)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              // Container(
              //   width: Get.width * 0.9,
              //   child: Row(
              //     children: [
              //       Text("المجموع بدون الضريبة:",style: TextStyle(color: App.grey,fontWeight: FontWeight.bold),),
              //       SizedBox(width: 8,),
              //       Text(Global.user!.appData.sumEkNetto.toStringAsFixed(2)+"€",style: TextStyle(color: App.grey),)
              //     ],
              //   ),
              // ),
              // SizedBox(height: 20,),
              // Container(
              //   width: Get.width * 0.9,
              //   child: Row(
              //     children: [
              //       Text("المجموع مع الضريبة:",style: TextStyle(color: App.grey,fontWeight: FontWeight.bold),),
              //       SizedBox(width: 8,),
              //       Text(Global.user!.appData.sumEkBrutto.toStringAsFixed(2)+"€",style: TextStyle(color: App.grey),)
              //     ],
              //   ),
              // ),
              Spacer(),
              GestureDetector(
                onTap: (){
                    Get.to(QRViewExample());
                  },
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: App.grey,width: 2)
                  ),
                  child: Icon(Icons.barcode_reader,color: App.grey,size: 80,),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                    Get.to(TypeBarcode());
                  },
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: App.grey,width: 2)
                  ),
                  child: Icon(Icons.keyboard,color: App.grey,size: 80,),
                ),
              ),


              Spacer(),
              Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/logo.png",),fit: BoxFit.contain)
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: Get.width*0.9,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Store.logout();
                        Get.offAll(Login());
                      },
                      child: Row(
                        children: [
                          Icon(Icons.logout,color: App.grey,),
                          SizedBox(width: 8,),
                          Text("تسجيل الخروج",style: TextStyle(color: App.grey,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }
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
