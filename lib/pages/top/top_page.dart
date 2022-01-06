import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  static String routeName = "/top";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('top')),
    );
  }
}
