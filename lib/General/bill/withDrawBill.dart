import '../Account/Account.dart';
import '../TimeAndID/Time.dart';

class withDrawBill {
  final String ID;
  final Account owner;
  final String numberCard;
  final String nameCard;
  final String nameBank;
  final Time time;
  final double money;

  withDrawBill(this.ID, this.owner, this.numberCard, this.nameCard, this.nameBank, this.time, this.money);

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data["id"] = this.ID;
    data["money"] = this.money;
    data["nameBank"] = nameBank.toString();
    data["nameCard"] = nameCard.toString();
    data["numberCard"] = numberCard.toString();
    data["owner"] = owner.toJson();
    data["time"] = time.toJson();
    return data;
  }

  factory withDrawBill.fromJson(Map<dynamic, dynamic> json) {
    return withDrawBill(json["id"].toString(),
        Account.fromJson(json["owner"]),
        json["numberCard"].toString(),
        json["nameCard"].toString(), json["nameBank"].toString(),
        Time.fromJson(json["time"]),
        double.parse(json["money"].toString())
    );
  }

}