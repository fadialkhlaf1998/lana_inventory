import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lana_inventory/model/product.dart';
import 'package:lana_inventory/model/user.dart';

class Api{

  static String url = "https://app.lana-gmbh.de";
  static String token = "";

  static Future<List<User>> login(String username , String password)async{
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse(url+'/api/mobile/login'));
    request.body = json.encode({
      "username": username,
      "password": password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data = (await response.stream.bytesToString());
      token = UserDecoder.fromJson(data).users.first.token;
      return UserDecoder.fromJson(data).users;
    }
    else {
    print(response.reasonPhrase);
    return <User>[];
    }
  }

  static Future<bool> addProduct(String item_id,String barcode,String title,
      double qty,double VK_netto,double VK_brutto,double Warenwert_VK_netto,
      double Warenwert_VK_brutto,double EK_netto,double EK_brutto,
      double EK_Summe_netto,double EK_Summe_brutto)async{
    var headers = {
      'Authorization': 'bearer '+token,
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse(url+'/api/mobile/product'));
    request.body = json.encode({
      "item_id": item_id,
      "barcode": barcode,
      "title": title,
      "qty": qty,
      "VK_netto": VK_netto,
      "VK_brutto": VK_brutto,
      "Warenwert_VK_netto": Warenwert_VK_netto,
      "Warenwert_VK_brutto": Warenwert_VK_brutto,
      "EK_netto": EK_netto,
      "EK_brutto": EK_brutto,
      "EK_Summe_netto": EK_Summe_netto,
      "EK_Summe_brutto": EK_Summe_brutto
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }

  static Future<List<Product>?> searchByBarcode(String code)async{
    var headers = {
      'Authorization': 'bearer '+token,
    };
    var request = http.Request('GET', Uri.parse(url+'/api/mobile/product/$code'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data = (await response.stream.bytesToString());
      return ProductDecoder.fromJson(data).products;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<bool> editQty(double qty, int product_id)async{
    var headers = {
      'Authorization': 'bearer '+token,
      'Content-Type': 'application/json',
    };
    var request = http.Request('PUT', Uri.parse(url+'/api/mobile/product'));
    request.body = json.encode({
      "qty": qty,
      "id": product_id
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
    print(response.reasonPhrase);
    return false;
    }

  }

}