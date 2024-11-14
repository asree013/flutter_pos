import 'dart:io';

void main() {
  print('statr');

  Future.delayed(Duration(seconds: 2), () {
    print('time out');
  });
}

