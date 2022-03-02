void main() {
String name = "mohamed";
print(name.length);
// ProblemSolving.fibonaciNumbers(10);
// ProblemSolving.multiplesOf3and5(4);

}
class ProblemSolving {
  static int multiplesOf3and5(number) {
   var sum = 0,
        i = 3;
    while (i < number) {
      if (i % 3 == 0 || i % 5 == 0) sum += i;
      i++;
    }
    return sum;
  }

  static void fibonaciNumbers(number) {
    late int n1 = 0, n2 = 1, n3;
    for (int i = 1; i <= number; i++) {
      n3 = n1 + n2;
      print('$i-  $n3');
      n1 = n2;
      n2 = n3;
    }
  }

}
  // int movie(int card, int ticket, double perc) {
  //   var counter = 0;
  //   num dticket = ticket;
  //   num sum = card;
  //   while (ticket * counter <= sum.ceil()) {
  //     counter++;
  //     sum +=  dticket *= perc;
  //   }
  //   return counter;
  // }
  // print(movie(500, 15, 0.9));

//   var x = [5,10,15];
//   x.join();
//   if (x==5 && x==10 && x==15){
//     print('challenge done');
// }else {
//     print('FAILD????');
//   }
//   for(var i=0; i<=100; i++) {
//     print('$i - كلبوب ');
//   }