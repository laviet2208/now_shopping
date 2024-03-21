import '../TimeAndID/Time.dart';

class voucher {
  final String id;
  final double totalMoney;
  final Time endTime;
  final Time startTime;
  final String content;

  const voucher({required this.totalMoney,required this.endTime,required this.startTime,required this.content, required this.id});



  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'total_money': totalMoney,
      'end_time': endTime?.toJson(), // sử dụng phương thức toJson() của lớp Time
      'start_time': startTime?.toJson(), // sử dụng phương thức toJson() của lớp Time
      'content': content,
    };
  }

  factory voucher.fromJson(Map<dynamic, dynamic> json) {
    return voucher(
      id: json['id'].toString(),
      totalMoney: double.parse(json['total_money'].toString()),
      endTime: Time.fromJson(json['end_time']),
      startTime: Time.fromJson(json['start_time']),
      content: "null",
    );
  }

}
