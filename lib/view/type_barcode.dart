import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lana_inventory/controller/add_product_controller.dart';
import 'package:lana_inventory/controller/edit_qty_controller.dart';
import 'package:lana_inventory/controller/type_barcode_controller.dart';
import 'package:lana_inventory/helper/app.dart';
import 'package:lana_inventory/model/product.dart';

class TypeBarcode extends StatelessWidget {
  
  TypeBarcodeController typeBarcodeController = Get.put(TypeBarcodeController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: App.background,
        body: Obx(() => SafeArea(
          child:
         typeBarcodeController.loading.value?
          Center(child: CircularProgressIndicator(),)
              :Column(
            children: [
              SizedBox(height: 15,),

              Container(
                width: Get.width*0.9,
                height: 50,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios,color: App.grey,),
                    ),
                    // SizedBox(width: 8,),
                    Text("كتابة الباركود",style: TextStyle(color: App.grey,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(width: Get.width,),

                      SizedBox(height: 15,),

                      Container(
                        width: Get.width * 0.9,
                        height: 50,
                        decoration: BoxDecoration(
                            color: App.backgroundLight,
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: TextField(
                          controller: typeBarcodeController.barcode,
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                            label: Text.rich(
                              TextSpan(
                                children: <InlineSpan>[
                                  WidgetSpan(
                                    child: Text(
                                      ' *',
                                      style: TextStyle(color: Colors.red,height: 0.5),
                                    ),
                                  ),

                                  WidgetSpan(
                                    child: Text(
                                      'الباركود',
                                      style: TextStyle(color: App.grey,height: 0.5),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),
                      GestureDetector(
                        onTap: (){
                          typeBarcodeController.searchTypedCode(context);
                        },
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                              color: App.primary,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child: Text("بحث",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),)
    );
  }
}
