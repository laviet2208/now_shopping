import 'package:ning_web/Finalclass/infoPay.dart';
import 'package:ning_web/General/Account/Account.dart';
import 'package:flutter/foundation.dart';
import '../General/Product/Product.dart';
import '../General/Product/Voucher.dart';

final Account currentAccount = Account(id: '', username: '', password: '', name: '', totalMoney: 0.0, avatarId: '');
final List<Product> cartProduct = [];
final List<voucher> voucherSelect = [];
final List<voucher> voucherBuySelect = [];
final InfoPay infoPay = InfoPay(ValueNotifier(0.0));
