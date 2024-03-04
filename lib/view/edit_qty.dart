import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lana_inventory/controller/add_product_controller.dart';
import 'package:lana_inventory/controller/edit_qty_controller.dart';
import 'package:lana_inventory/helper/app.dart';
import 'package:lana_inventory/model/product.dart';

class EditQty extends StatelessWidget {
  Product product;

  EditQty(this.product){
    editQtyController.product = product;
    editQtyController.qty.text = this.product.qty.toString();
  }

  EditQtyController editQtyController = Get.put(EditQtyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: App.background,
        body: Obx(() => SafeArea(
          child:
          editQtyController.successfully.value?
          Center(
            child: Icon(Icons.check_circle_outline,color: Colors.green,size: 120),
          )
              :editQtyController.loading.value?
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
                    Text("تعديل الكمية",style: TextStyle(color: App.grey,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: Get.width*0.9,
                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("#"+editQtyController.product!.barcode,style: TextStyle(color: App.grey,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("#"+editQtyController.product!.title,style: TextStyle(color: App.grey),),
                      ],
                    ),
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
                          controller: editQtyController.qty,
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
                                      'العدد',
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
                          editQtyController.editProductQty(context);
                        },
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                              color: App.primary,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child: Text("حفظ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
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
