
String numberToWords(number){
  
  var wordsBelowTwenty = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
                            "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"];
  var tensWords = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"];
    
    
  var thousands = ["", "Thousand", "Million", "Billion"];
  
  
  String convertChunk(int chunk){
    if(chunk == 0){
      return 'Zero';
    }
    String result = '';
    
    if (chunk >= 100){
            result = result + wordsBelowTwenty[chunk ~/ 100] + " Hundred ";
            chunk %= 100;
                                         }
    if (chunk >= 20){
            result = result + tensWords[chunk ~/ 10] + " ";
            chunk %= 10;
    }
    if (chunk > 0){
            result = result + wordsBelowTwenty[chunk] + " ";
    }
    return result;
  
  }
  
  if (number == 0){
        return "Zero";}
  
  String words = '';
  int chunkIndex = 0;
  
  while (number > 0){
    int chunk;
        chunk = number % 1000;
        if (chunk != 0){
            words = convertChunk(chunk) + thousands[chunkIndex] + " " + words;}
        number ~/= 1000;
        chunkIndex += 1;
    }
    
    return words.trim();
  
}




void main()
{
  
  int a = 1000;
  
//   for(var i = a; i<10000; i+=3){
//     print('\n');
//     print(numberToWords(i));
//   }
  print(numberToWords(5683765465));
  
}
