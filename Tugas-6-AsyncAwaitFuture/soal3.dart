import 'dart:async';

Future<void> line1() async {
  print('pernahkah kau merasa');
}

Future<void> line2() async {
  print('pernahkah kau merasa');
}

Future<void> line3() async {
  print('pernahkah kau merasa');
}

Future<void> line4() async {
  print('Hatimu hampa, pernahkah kau merasa, hatimu kosong');
}

Future<void> main() async {
  print('Ready. sing');
  await Future.delayed(Duration(seconds: 5), () async {
    await line1();
  });

  await Future.delayed(Duration(seconds: 3), () async {
    await line2();
  });

  await Future.delayed(Duration(seconds: 2), () async {
    await line3();
  });

  await Future.delayed(Duration(seconds: 1), () async {
    await line4();
  });
}
