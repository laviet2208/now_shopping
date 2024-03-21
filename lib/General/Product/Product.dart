import 'package:ning_web/General/Product/Evaluate.dart';

import '../Shop/Shop.dart';

class Product {
  String id;
  String name;
  String content;
  List<int> type = [];
  double cost;
  List<String> url = [];
  List<String> imageList = [];
  List<Evaluate> evaluateList = [];
  bool isSale;
  Shop shop;

  Product({
    required this.id,
    required this.name,
    required this.content,
    required this.type,
    required this.cost,
    required this.url,
    required this.imageList,
    required this.evaluateList,
    required this.isSale,
    required this.shop,
  });

  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'content': content,
      'type': type,
      'cost': cost,
      'url': url,
      'imageList': imageList,
      'evaluateList': evaluateList.map((e) => e.toJson()).toList(),
      'isSale': isSale,
      'shop': shop.toJson(),
    };
  }

  factory Product.fromJson(Map<dynamic, dynamic> json) {
    List<Evaluate> evalua = [];
    List<int> type = [];
    List<String> url = [];
    List<String> imgL = [];

    if (json["evaluateList"] != null) {
      for (final result in json["evaluateList"]) {
        evalua.add(Evaluate.fromJson(result));
      }
    }

    if (json["type"] != null) {
      for (final result in json["type"]) {
        type.add(int.parse(result.toString()));
      }
    }

    if (json["url"] != null) {
      for (final result in json["url"]) {
        url.add(result.toString());
      }
    }

    if (json["imageList"] != null) {
      for (final result in json["imageList"]) {
        imgL.add(result.toString());
      }
    }

    String boolstr = json["isSale"].toString();
    bool issale = false;

    if (boolstr == "true") {
      issale = true;
    }

    return Product(
      id: json['id'].toString(),
      name: json['name'].toString(),
      content: json['content'].toString(),
      type: type,
      cost: double.parse(json['cost'].toString()),
      url: url,
      imageList: imgL,
      evaluateList: [],
      isSale: issale,
      shop: Shop.fromJson(json['shop']),
    );
  }

}
