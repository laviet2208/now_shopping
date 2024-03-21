import '../Account/Account.dart';
import 'package:flutter/material.dart';

class Shop {
  Account owner; //thông tin chủ shop
  List<Account> followList = []; // use List instead of ArrayList
  String id; //thông tin id shop
  String url; //url ảnh đại diện của shop
  String name; //thông tin tên shop

  Shop({
    required this.owner,
    required this.id,
    required this.url,
    required this.name,
    required List<Account> followList,
  });

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['owner'] = this.owner?.toJson();
    data['followList'] = this.followList?.map((e) => e.toJson()).toList();
    data['id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    return data;
  }

  factory Shop.fromJson(Map<dynamic, dynamic> json) {
    List<Account> flList = [];

    if (json["followList"] != null) {
      for (final result in json["followList"]) {
        flList.add(Account.fromJson(result));
      }
    } else {
      
    }

    return Shop(
      owner: Account.fromJson(json['owner']),
      followList: [],
      id: json['id'],
      url: json['url'],
      name: json['name'],
    );
  }
}
