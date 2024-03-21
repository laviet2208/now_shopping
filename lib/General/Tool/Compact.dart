import 'dart:math';

String compactString(int n, String str) {
  if (n >= str.length) {
    return str;
  }
  return str.substring(0, n) + "...";
}

int getLine(int element, int maxCount) {
  return (element / maxCount).ceil();
}

int get_randomnumber(int start, int end) {
  Random random = Random();
  return start + random.nextInt(end - start + 1);
}