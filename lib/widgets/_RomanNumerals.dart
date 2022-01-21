import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RomanNumeralsPage extends StatefulWidget {
  static const tag = 'chiffres_romains';

  @override
  _RomanNumeralsPageState createState() => _RomanNumeralsPageState();
}

class _RomanNumeralsPageState extends State<RomanNumeralsPage> {

  final _unitController = TextEditingController();
  int _data = 0;

  final _numbers = [1,4,5,9,10,40,50,90,100,400,500,900,1000];
  final _roman = ['I','IV','V','IX', 'X','XL', 'L','XC', 'C','CD', 'D','CM','M'];
  String _romanNumerals = '';
  int i = 12;
  bool numberExist = false;

  NumberToRomanNumerals(num) {
    while(num != 0){
      if (_numbers[i] <= num) {
        _romanNumerals += _roman[i];
        num = num - _numbers[i];
      } else {
        i -= 1;
      }
      return _romanNumerals;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convertir en chiffres romains'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _data = int.parse(_unitController.text);
                      numberExist = true;
                    });
                  },
                  controller: _unitController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    labelText: 'Saisir la valeur à convertir',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text((() {
                  if(numberExist){
                    return NumberToRomanNumerals(_data);
                  } return '';})(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ), textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
