String decrypt(String data, String key) {
  String output = '';
  List<int> skipLength = [];
  for(var i in key.split('')){
    skipLength.add(int.parse(i));
  }

  int index = 0;
  for (int skip in skipLength) {
    index += skip;
    output += data.substring(index, index + 4);
    index += 4;
  }
  
  var part1 = output.substring(0,4);
  var part2 = output.substring(4,4*2);
  var part3 = output.substring(4*2,4*3);
  var part4 = output.substring(4*3,);
  
  var finalOutput = part4 + part3 + part2 + part1;
  return finalOutput;
}

void main() {
//   stdout.write('Enter input string : ');
  String userInput = 'EJLGNAGS9GLI87RLW8RDO46OCUZD8103';
  String key = userInput.substring(userInput.length - 4);
  String data = userInput.substring(0, userInput.length - 4);
  String finalStr = decrypt(data, key);
  print(finalStr);
}
