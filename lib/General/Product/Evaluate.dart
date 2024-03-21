import 'package:ning_web/General/Account/Account.dart';

class Evaluate {
  Account owner;
  String content;
  int star;

  Evaluate({
      required this.owner,
      required this.content,
      required this.star});

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['owner'] = this.owner.toJson();
    data['content'] = this.content;
    data['star'] = this.star;
    return data;
  }

  factory Evaluate.fromJson(Map<dynamic, dynamic> json) {
    return Evaluate(
        owner : Account.fromJson(json["owner"]),
        content : json["content"].toString(), 
        star : int.parse(json["star"].toString()));
  }
}