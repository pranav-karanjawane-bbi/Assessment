import 'dart:collection';

base class Entry<T> extends LinkedListEntry<Entry<T>> {
  T value;
  Entry(this.value);
  @override
  String toString() {
    return '$value';
  }
}

LinkedList<Entry<int>> bubblesort(myLinkedList,arrlen){
  for(int i = 0; i< arrlen-1; i++){
    for(int j = 0; j<arrlen-1; j++){
      if(myLinkedList.elementAt(j).value > myLinkedList.elementAt(j+1).value){
        var temp = 0;
        temp = myLinkedList.elementAt(j).value;
        myLinkedList.elementAt(j).value = myLinkedList.elementAt(j+1).value;
        myLinkedList.elementAt(j+1).value = temp;
      }
    }
  }
  return myLinkedList;
}


void main(){
  var myArr = [3,5,2,7,9,1];
  int arrlen = myArr.length;
  print(myArr);
  var myLinkedList = LinkedList<Entry<int>>();
  
  for(int i = 0; i <arrlen; i++){
      myLinkedList.add(Entry(myArr[i]));
  }
  print("this is thge unsorted linked list : $myLinkedList");
  
  print("this is the sorted Linked LIst : ${bubblesort(myLinkedList,arrlen)}");
}
