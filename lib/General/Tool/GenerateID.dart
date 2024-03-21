import 'dart:math';

String generateID(int count) {
  final character = "12CDEFGH3GH789ABCDEFGH";
  var returnString = "";
  final length = count;
  final random = Random();
  var text = List.generate(length, (index) => character[random.nextInt(character.length)]);

  for (var i = 0 ; i < text.length ; i++) {
    returnString += text[i];
  }

  return returnString;
}