import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FOOBAR'),
      ),
      body: Center(
        child: Text('Body Foobar'),
      ),
    );
  }
}
