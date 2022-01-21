import 'package:flutter/material.dart';
import '../models/ConvertNumericValue.dart';

class ConvertNumericValueApp extends StatelessWidget {
  const ConvertNumericValueApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Convert numeric value';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const NumericValueForm(),
      ),
    );
  }
}

class NumericValueForm extends StatefulWidget {
  const NumericValueForm({Key? key}) : super(key: key);

  @override
  _NumericValueFormState createState() => _NumericValueFormState();
}


class _NumericValueFormState extends State<NumericValueForm> {

  TextEditingController numericValue = TextEditingController();
  String dropdownValueUnit1 = 'BIN';
  String dropdownValueUnit2 = 'HEX';
  bool unitsSelected = false;
  String result = '0';

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: numericValue,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Numeric value',
            ),
          ),
        ),
        DropdownButton<String>(
            value: dropdownValueUnit1,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValueUnit1 = newValue!;
                unitsSelected = false;
              });
              if(numericValue.text != '' && dropdownValueUnit1.isNotEmpty && dropdownValueUnit2.isNotEmpty) {
                unitsSelected = true;
                switch(dropdownValueUnit1)
                {
                  case 'BIN' :
                    if(dropdownValueUnit2 == 'HEX') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'BIN', 'HEX');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'OCT') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'BIN', 'OCT');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'DEC') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'BIN', 'DEC');
                      result = convertNumericValue.convertNumericValue();
                    }
                    break;
                  case 'HEX' :
                    if(dropdownValueUnit2 == 'DEC') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'HEX', 'DEC');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'OCT') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'HEX', 'OCT');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'BIN') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'HEX', 'BIN');
                      result = convertNumericValue.convertNumericValue();
                    }
                    break;
                  case 'OCT' :
                    if(dropdownValueUnit2 == 'BIN') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'OCT', 'BIN');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'DEC') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'OCT', 'DEC');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'HEX') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'OCT', 'HEX');
                      result = convertNumericValue.convertNumericValue();
                    }
                    break;

                  case 'DEC' :
                    if(dropdownValueUnit2 == 'BIN') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'DEC', 'BIN');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'OCT') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'DEC', 'OCT');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'HEX') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'DEC', 'HEX');
                      result = convertNumericValue.convertNumericValue();
                    }
                    break;
                }
              }
            },
            items: <String>['DEC', 'HEX', 'OCT', 'BIN']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()
        ),

        Text('Convert in'),

        DropdownButton<String>(
            value: dropdownValueUnit2,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValueUnit2 = newValue!;
                unitsSelected = false;
              });

              if(numericValue.text != '' && dropdownValueUnit1.isNotEmpty && dropdownValueUnit2.isNotEmpty) {
                unitsSelected = true;
                switch(dropdownValueUnit1)
                {
                  case 'BIN' :
                    if(dropdownValueUnit2 == 'HEX') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'BIN', 'HEX');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'OCT') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'BIN', 'OCT');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'DEC') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'BIN', 'DEC');
                      result = convertNumericValue.convertNumericValue();
                    }
                    break;
                  case 'HEX' :
                    if(dropdownValueUnit2 == 'DEC') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'HEX', 'DEC');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'OCT') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'HEX', 'OCT');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'BIN') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'HEX', 'BIN');
                      result = convertNumericValue.convertNumericValue();
                    }
                    break;
                  case 'OCT' :
                    if(dropdownValueUnit2 == 'BIN') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'OCT', 'BIN');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'DEC') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'OCT', 'DEC');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'HEX') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'OCT', 'HEX');
                      result = convertNumericValue.convertNumericValue();
                    }
                    break;

                  case 'DEC' :
                    if(dropdownValueUnit2 == 'BIN') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'DEC', 'BIN');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'OCT') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'DEC', 'OCT');
                      result = convertNumericValue.convertNumericValue();
                    }
                    if(dropdownValueUnit2 == 'HEX') {
                      ConvertNumericValue convertNumericValue = ConvertNumericValue(numericValue.text, 'DEC', 'HEX');
                      result = convertNumericValue.convertNumericValue();
                    }
                    break;
                }
              }
            },
            items: <String>['DEC', 'HEX', 'OCT', 'BIN']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()
        ),
        const SizedBox(height: 20.0,),
        Text((() {
          if(unitsSelected){
            return '$result';
          } return '';})(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ), textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
