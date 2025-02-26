 import 'package:flutter/material.dart';


class HotelsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hotels View")),
      body: Center(
        child: Text("Here are the hotels", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}