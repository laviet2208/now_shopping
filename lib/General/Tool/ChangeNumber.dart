
import 'package:ning_web/General/Product/Product.dart';
import 'package:ning_web/General/TimeAndID/Time.dart';

import '../Product/Evaluate.dart';

String getStringNumber(double number) {
  String result = number.toStringAsFixed(0); // làm tròn số
  result = result.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.'); // chuyển đổi phân tách hàng nghìn
  return result;
}

String countRate(List<Evaluate> evaluate) {
  if (evaluate.isEmpty) {
    return "0.0";
  } else {
    int sum = 0;
    for (int i = 0; i < evaluate.length; i++) {
      sum += evaluate[i].star;
    }
    double avg = sum / evaluate.length;
    return avg.toStringAsFixed(1);
  }
}

double countRatedb(List<Evaluate> evaluate) {
  if (evaluate.isEmpty) {
    return 0;
  } else {
    int sum = 0;
    for (int i = 0; i < evaluate.length; i++) {
      sum += evaluate[i].star;
    }
    double avg = sum / evaluate.length;
    return avg;
  }
}

String countavgProductcost(List<Product> product) {
  if (product.isEmpty) {
    return "0.0";
  } else {
    double sum = 0;
    for (int i = 0; i < product.length; i++) {
      sum += product[i].cost;
    }
    double avg = sum / product.length;
    return avg.toStringAsFixed(1);
  }
}

String getTimeString(Time time) {
  return time.day.toString() + "/" + time.month.toString() + "/" + time.year.toString();
}