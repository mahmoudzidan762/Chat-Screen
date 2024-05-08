import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  static String id = "DoneScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doce Screen'),
      ),
    );
  }
}
