import 'package:flutter/material.dart';

import 'RegisterPage.dart';

void main() {
  runApp(MaterialApp(home: Myapp(),));
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterPage();
  }
}
