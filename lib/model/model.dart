// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  String name;
  String phone;
  String address;
  String symptom;
  String status;

  Welcome({
    required this.name,
    required this.phone,
    required this.address,
    required this.symptom,
    required this.status,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    symptom: json["symptom"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "address": address,
    "symptom": symptom,
    "status": status,
  };
}
