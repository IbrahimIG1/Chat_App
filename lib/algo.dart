import 'package:flutter/material.dart';

class AlgoTest extends StatelessWidget {
  AlgoTest({super.key});

  List nums = [1, 4, 2, 10, 2, 3, 1, 0, 20];
  int k = 4;
  void sumNum() {
    for (int i = 0; i < nums.length - k + 1; i++) {
      double currentSum = 0;
      print('i => $i');
      for (int j = 0; j < i; j++) {
        print('j => $j');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(sumNum);
    return Container();
  }
}
