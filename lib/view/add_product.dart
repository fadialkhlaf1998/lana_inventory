import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lana_inventory/controller/add_product_controller.dart';
import 'package:lana_inventory/helper/app.dart';

class AddProduct extends StatelessWidget {
  // AddProduct(bool fromScan){
  //   if(fromScan){
  //
  //   }
  // }

  AddProductController addProductController = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App.background,
      body: Obx(() => SafeArea(
        child:
            addProductController.successfully.value?
                Center(
                  child: Icon(Icons.check_circle_outline,color: Colors.green,size: 120),
                )
        :addProductController.loading.value?
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
                  Text("إضافة منتج",style: TextStyle(color: App.grey,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(width: Get.width,),
                    // SizedBox(height: 15,),
                    // Container(
                    //   width: Get.width * 0.9,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //       color: App.backgroundLight,
                    //       borderRadius: BorderRadius.circular(25)
                    //   ),
                    //   child: TextField(
                    //     controller: addProductController.itemId,
                    //     style: TextStyle(color: Colors.white),
                    //     decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    //       border: InputBorder.none,
                    //       label: Text.rich(
                    //         TextSpan(
                    //           children: <InlineSpan>[
                    //             WidgetSpan(
                    //               child: Text(
                    //                 'معرف المنتج',
                    //                 style: TextStyle(color: App.grey),
                    //               ),
                    //             ),
                    //
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 15,),
                    Container(
                      width: Get.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                          color: App.backgroundLight,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        controller: addProductController.barcode,
                        style: TextStyle(color: Colors.white),
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
                                    'باركود',
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
                    Container(
                      width: Get.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                          color: App.backgroundLight,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        controller: addProductController.title,
                        style: TextStyle(color: Colors.white),
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
                                    'العنوان',
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
                    Container(
                      width: Get.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                          color: App.backgroundLight,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        controller: addProductController.qty,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        onChanged: (val){
                          addProductController.calc();
                        },
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
                    Container(
                      width: Get.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                          color: App.backgroundLight,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        controller: addProductController.VK_netto,
                        style: TextStyle(color: Colors.white),
                        onChanged: (val){
                          addProductController.calc();
                        },
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
                                    'سعر البيع بدون ضريبة',
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
                    Container(
                      width: Get.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                          color: App.backgroundLight,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        controller: addProductController.VK_brutto,
                        style: TextStyle(color: Colors.white),
                        onChanged: (val){
                          addProductController.calc();
                        },
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
                                    'سعر البيع مع ضريبة',
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
                    Container(
                      width: Get.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                          color: App.backgroundLight,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        controller: addProductController.Warenwert_VK_netto,
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
                                    'قيمة البيع الاجمالية بدون ضريبة للمنتج',
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
                    Container(
                      width: Get.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                          color: App.backgroundLight,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        controller: addProductController.Warenwert_VK_brutto,
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
                                    'قيمة البيع الاجمالية مع ضريبة للمنتج',
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
                    Container(
                      width: Get.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                          color: App.backgroundLight,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        controller: addProductController.EK_netto,
                        style: TextStyle(color: Colors.white),
                        onChanged: (val){
                          addProductController.calc();
                        },
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
                                    'سعر الشراء بدون ضريبة',
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
                    Container(
                      width: Get.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                          color: App.backgroundLight,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        controller: addProductController.EK_brutto,
                        style: TextStyle(color: Colors.white),
                        onChanged: (val){
                          addProductController.calc();
                        },
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
                                    'سعر الشراء مع ضريبة',
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
                    Container(
                      width: Get.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                          color: App.backgroundLight,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        controller: addProductController.EK_Summe_netto,
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
                                    'مجموع سعر الشراء للمنتج بدون ضريبة',
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
                    Container(
                      width: Get.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                          color: App.backgroundLight,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextField(
                        controller: addProductController.EK_Summe_brutto,
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
                                    'مجموع سعر الشراء للمنتج مع ضريبة',
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
                        addProductController.addProduct(context);
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
