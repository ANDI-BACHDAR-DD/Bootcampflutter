import 'dart:async';

void main(List<String> args) {
  Future.delayed(Duration(seconds: 0), () {
    print('Life');
  });

  Future.delayed(Duration(seconds: 1), () {
    print('is');
  });

  Future.delayed(Duration(seconds: 2), () {
    print('never flat');
  });
}
