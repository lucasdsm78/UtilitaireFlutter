import 'package:flutter/material.dart';
import '../models/ConvertTemperature.dart';

class ConverterTemperature extends StatelessWidget {
  const ConverterTemperature({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Convert temperature';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const ConvertTemperatureForm(),
      ),
    );
  }
}

class ConvertTemperatureForm extends StatefulWidget {
  const ConvertTemperatureForm({Key? key}) : super(key: key);

  @override
  _ConvertTemperatureFormState createState() => _ConvertTemperatureFormState();
}


class _ConvertTemperatureFormState extends State<ConvertTemperatureForm> {

  TextEditingController temperatureValue = TextEditingController();
  String dropdownValueUnit1 = 'Celsius';
  String dropdownValueUnit2 = 'Farenheit';
  double result = 0;
  bool unitsSelected = false;

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
            controller: temperatureValue,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Temperature value',
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
              if(temperatureValue.text != '' && dropdownValueUnit1.isNotEmpty && dropdownValueUnit2.isNotEmpty) {
                unitsSelected = true;
                switch(dropdownValueUnit1)
                {
                  case 'Kelvin' :
                    if(dropdownValueUnit2 == 'Celsius') {
                      ConvertTemperature convertTemperature = ConvertTemperature(double.parse(temperatureValue.text), 'K', 'C');
                      result = convertTemperature.convertTemperature();
                    }
                    if(dropdownValueUnit2 == 'Farenheit') {
                      ConvertTemperature convertTemperature = ConvertTemperature(double.parse(temperatureValue.text), 'K', 'F');
                      result = convertTemperature.convertTemperature();
                    }
                    break;
                  case 'Celsius' :
                    if(dropdownValueUnit2 == 'Kelvin') {
                      ConvertTemperature convertTemperature = ConvertTemperature(double.parse(temperatureValue.text), 'C', 'K');
                      result = convertTemperature.convertTemperature();
                    }
                    if(dropdownValueUnit2 == 'Farenheit') {
                      ConvertTemperature convertTemperature = ConvertTemperature(double.parse(temperatureValue.text), 'C', 'F');
                      result = convertTemperature.convertTemperature();
                    }
                    break;
                  case 'Farenheit' :
                    if(dropdownValueUnit2 == 'Celsius') {
                      ConvertTemperature convertTemperature = ConvertTemperature(double.parse(temperatureValue.text), 'F', 'C');
                      result = convertTemperature.convertTemperature();
                    }
                    if(dropdownValueUnit2 == 'Kelvin') {
                      ConvertTemperature convertTemperature = ConvertTemperature(double.parse(temperatureValue.text), 'F', 'K');
                      result = convertTemperature.convertTemperature();
                    }
                    break;
                }
              }
            },
            items: <String>['Celsius', 'Farenheit', 'Kelvin']
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

              if(temperatureValue.text != '' && dropdownValueUnit1.isNotEmpty && dropdownValueUnit2.isNotEmpty) {
                unitsSelected = true;
                switch(dropdownValueUnit1)
                {
                  case 'Kelvin' :
                    if(dropdownValueUnit2 == 'Celsius') {
                      ConvertTemperature convertTemperature = ConvertTemperature(double.parse(temperatureValue.text), 'K', 'C');
                      result = convertTemperature.convertTemperature();
                    }
                    if(dropdownValueUnit2 == 'Farenheit') {
                      ConvertTemperature convertTemperature = ConvertTemperature(double.parse(temperatureValue.text), 'K', 'F');
                      result = convertTemperature.convertTemperature();
                    }
                    break;
                  case 'Celsius' :
                    if(dropdownValueUnit2 == 'Kelvin') {
                      ConvertTemperature convertTemperature = ConvertTemperature(double.parse(temperatureValue.text), 'C', 'K');
                      result = convertTemperature.convertTemperature();
                    }
                    if(dropdownValueUnit2 == 'Farenheit') {
                      ConvertTemperature convertTemperature = ConvertTemperature(double.parse(temperatureValue.text), 'C', 'F');
                      result = convertTemperature.convertTemperature();
                    }
                    break;
                  case 'Farenheit' :
                    if(dropdownValueUnit2 == 'Celsius') {
                      ConvertTemperature convertTemperature = ConvertTemperature(double.parse(temperatureValue.text), 'F', 'C');
                      result = convertTemperature.convertTemperature();
                    }
                    if(dropdownValueUnit2 == 'Kelvin') {
                      ConvertTemperature convertTemperature = ConvertTemperature(double.parse(temperatureValue.text), 'F', 'K');
                      result = convertTemperature.convertTemperature();
                    }
                    break;
                }
              }
            },
            items: <String>['Celsius', 'Farenheit', 'Kelvin']
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