String decrypt(String data, String key) {
  String output = '';
  List<int> skipLength = [];
  for(var i in key.split('')){
    skipLength.add(int.parse(i));
  }

  int index = 0;
  for (int skip in skipLength) {
    index += skip;
    output += data.substring(index, index + 8);
    index += 8;
  }
  return output;
}

void main() {
//   stdout.write('Enter input string : ');
  String userInput = '2TZ1CININJSNAOETOP7TBN4FZEULH3DJKZH7PDLP3C54JJKDOTUIPEGO8097';
  String key = userInput.substring(userInput.length - 4);
  String data = userInput.substring(0, userInput.length - 4);
  String finalStr = decrypt(data, key);
  print(finalStr);
}
