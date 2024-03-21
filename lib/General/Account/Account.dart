 import '../Product/Product.dart';
import '../Product/Voucher.dart';

class Account {
  String id;
  String username;
  String password;
  String name;
  String avatarId;

  double totalMoney;
  List<Product> productCarts = [];
  List<Product> wishList = [];
  List<voucher> voucherList = [];

  Account({
    required this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.totalMoney,
    this.productCarts = const [],
    this.wishList = const [],
    this.voucherList = const [],
    required this.avatarId,
  });


  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['name'] = this.name;
    data['avatar_ID'] = this.avatarId;
    data['total_money'] = this.totalMoney;
    data['productCarts'] = this.productCarts.map((product) => product.toJson()).toList();
    data['wishList'] = this.wishList.map((product) => product.toJson()).toList();
    data['voucherList'] = this.voucherList.map((voucher) => voucher.toJson()).toList();
    return data;
  }

  factory Account.fromJson(Map<dynamic, dynamic> json) {
    List<Product> cart = [];
    List<Product> wish = [];
    List<voucher> vou = [];

    if (json["productCarts"] != null) {
      for (final result in json["productCarts"]) {
        cart.add(Product.fromJson(result));
      }
    }

    if (json["wishList"] != null) {
      for (final result in json["wishList"]) {
        wish.add(Product.fromJson(result));
      }
    }

    if (json["voucherList"] != null) {
      for (final result in json["voucherList"]) {
        vou.add(voucher.fromJson(result));
      }
    }

    return Account(
      id: json['id'].toString(),
      username: json['username'].toString(),
      password: json['password'].toString(),
      name: json['name'].toString(),
      avatarId: json['avatar_ID'].toString(),
      totalMoney: double.parse(json['total_money'].toString()),
      productCarts: cart,
      wishList: wish,
      voucherList: vou,
    );
  }
}
