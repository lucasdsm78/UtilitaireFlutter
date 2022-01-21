import 'package:flutter/material.dart';

class RomanNumeralsPage extends StatefulWidget {
  static const tag = 'chiffres_romains';

  @override
  _RomanNumeralsPageState createState() => _RomanNumeralsPageState();
}

class _RomanNumeralsPageState extends State<RomanNumeralsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convertir en chiffres romains'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('Chiffres romains'),
          ],
        ),
      ),
    );
  }
}
