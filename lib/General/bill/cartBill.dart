import 'package:ning_web/General/Product/Product.dart';

import '../Account/Account.dart';

class cartBill {
  final String ID;
  final Account owner;
  final List<Product> products;
  final double totalMoney;
  final String status;
  final String locate;
  final String phoneNum;

  cartBill(this.ID, this.owner, this.products, this.totalMoney, this.status, this.locate, this.phoneNum);

  factory cartBill.fromJson(Map<dynamic, dynamic> json) {
    List<Product> cart = [];

    if (json["products"] != null) {
      for (final result in json["products"]) {
        cart.add(Product.fromJson(result));
      }
    }

    return cartBill(json["id"].toString(), Account.fromJson(json["owner"]), cart, double.parse(json["totalMoney"].toString()), json["status"].toString(), json["locate"].toString(), json["phoneNum"].toString());
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data["id"] = this.ID;
    data["owner"] = this.owner.toJson();
    data["products"] = this.products.map((product) => product.toJson()).toList();
    data["totalMoney"] = this.totalMoney;
    data["status"] = status.toString();
    data["locate"] = locate.toString();
    data["phoneNum"] = phoneNum.toString();
    return data;
  }
}