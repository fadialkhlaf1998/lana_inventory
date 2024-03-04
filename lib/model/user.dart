import 'package:meta/meta.dart';
import 'dart:convert';

class UserDecoder {
  List<User> users;

  UserDecoder({
    required this.users,
  });

  factory UserDecoder.fromJson(String str) => UserDecoder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDecoder.fromMap(Map<String, dynamic> json) => UserDecoder(
    users: List<User>.from(json["users"].map((x) => User.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "users": List<dynamic>.from(users.map((x) => x.toMap())),
  };
}

class User {
  int accountId;
  String username;
  String password;
  String name;
  String role;
  String token;
  AppData appData;

  User({
    required this.accountId,
    required this.username,
    required this.password,
    required this.name,
    required this.role,
    required this.token,
    required this.appData,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    accountId: json["account_id"],
    username: json["username"],
    password: json["password"],
    name: json["name"],
    role: json["role"],
    token: json["token"],
    appData: AppData.fromMap(json["app_data"]),
  );

  Map<String, dynamic> toMap() => {
    "account_id": accountId,
    "username": username,
    "password": password,
    "name": name,
    "role": role,
    "token": token,
    "app_data": appData.toMap(),
  };
}

class AppData {
  double sumEkNetto;
  double sumEkBrutto;
  DateTime? createdAt;

  AppData({
    required this.sumEkNetto,
    required this.sumEkBrutto,
    required this.createdAt,
  });

  factory AppData.fromJson(String str) => AppData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppData.fromMap(Map<String, dynamic> json) => AppData(
    sumEkNetto: json["sum_ek_netto"].toDouble(),
    sumEkBrutto: json["sum_ek_brutto"].toDouble(),
    createdAt: json["created_at"]==null?null:DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toMap() => {
    "sum_ek_netto": sumEkNetto,
    "sum_ek_brutto": sumEkBrutto,
    "created_at": createdAt!.toIso8601String(),
  };
}
