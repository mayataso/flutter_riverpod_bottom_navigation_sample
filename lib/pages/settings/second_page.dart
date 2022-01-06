import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  static String routeName = "/second";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('second')),
    );
  }
}
