
import 'package:firebase_database/firebase_database.dart';
import '../../../Finalclass/finalclass.dart';
import '../../../General/Account/Account.dart';

class LoginController {
  static void getAccountData(String email) async {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("Account").onValue.listen((event) {
      final dynamic account = event.snapshot.value;
      account.forEach((key, value) {
        if (value["username"].toString() == email) {
          Account myacc = Account.fromJson(value);
          print("NextStep");
          currentAccount.username = myacc.username;
          currentAccount.password = myacc.password;
          currentAccount.id = myacc.id;
          currentAccount.avatarId = myacc.avatarId;
          currentAccount.name = myacc.name;
          currentAccount.totalMoney = myacc.totalMoney;
          currentAccount.productCarts = myacc.productCarts;
          currentAccount.voucherList = myacc.voucherList;
          currentAccount.wishList = myacc.wishList;
          print(currentAccount.toJson().toString());

        }
      });
    }).onDone(() {
      print("get data Success");
    });
  }
}