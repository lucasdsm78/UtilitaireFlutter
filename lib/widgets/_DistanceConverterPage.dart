import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DistanceConverterPage extends StatefulWidget {
  static const tag = 'distance_page';

  @override
  _DistanceConverterPageState createState() => _DistanceConverterPageState();
}

class _DistanceConverterPageState extends State<DistanceConverterPage> {

  // 2 tableaux pour alimenter les dropdown
  final _fromMeasureItems = ['m','km'];
  final _toMeasureItems = ['m','km','dm','cm','mm','nm','in','ft','yd'];

  final _unitController = TextEditingController();
  var _fromUnit;
  var _toUnit;
  int _result = 0;
  double _finalResult = 0;
  bool unitsSelected = false;

  // Création d'un dropdown menu
  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convertisseur d\'unités de mesure'),
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
                      _result = int.parse(_unitController.text);
                      unitsSelected = false;
                    });
                    if(_unitController.text != '' && _fromUnit.isNotEmpty  && _toUnit.isNotEmpty) {
                      unitsSelected = true;
                      if(_fromUnit == 'o' && _toUnit == 'o'){
                        _finalResult = _result * 1;
                      } else if(_fromUnit == 'o' && _toUnit == 'Ko'){
                        _finalResult = _result / 1000;
                      } else if(_fromUnit == 'o' && _toUnit == 'Mo'){
                        _finalResult = _result / 1000000;
                      } else if(_fromUnit == 'o' && _toUnit == 'Go'){
                        _finalResult = _result * 1e-9;
                      } else if(_fromUnit == 'o' && _toUnit == 'To'){
                        _finalResult = _result * 1e-12;
                      } else if(_fromUnit == 'o' && _toUnit == 'Po'){
                        _finalResult = _result * 1e-15;
                      } else if(_fromUnit == 'Ko' && _toUnit == 'Ko'){
                        _finalResult = _result * 1;
                      } else if(_fromUnit == 'Ko' && _toUnit == 'o'){
                        _finalResult = _result * 1000;
                      } else if(_fromUnit == 'Ko' && _toUnit == 'Mo'){
                        _finalResult = _result / 1000 ;
                      } else if(_fromUnit == 'Ko' && _toUnit == 'Go'){
                        _finalResult = _result / 1000000;
                      } else if(_fromUnit == 'Ko' && _toUnit == 'To'){
                        _finalResult = _result * 1e-9;
                      } else if(_fromUnit == 'Ko' && _toUnit == 'Po'){
                        _finalResult = _result * 1e-12;
                      }
                    }
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
              const SizedBox(height: 16.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: const Text('m',),
                          value: _fromUnit,
                          items: _fromMeasureItems.map(buildMenuItem).toList(),
                          onChanged: (value) {
                            setState(() {
                              _result = int.parse(_unitController.text);
                              this._fromUnit = value;
                              unitsSelected = false;
                            });
                            if(_unitController.text != '' && _fromUnit.isNotEmpty  && _toUnit.isNotEmpty) {
                              unitsSelected = true;
                              if(_fromUnit == 'm' && _toUnit == 'm'){
                                _finalResult = _result * 1;
                              } else if(_fromUnit == 'm' && _toUnit == 'km'){
                                _finalResult = _result / 1000;
                              } else if(_fromUnit == 'm' && _toUnit == 'dm'){
                                _finalResult = _result / 10;
                              } else if(_fromUnit == 'm' && _toUnit == 'cm'){
                                _finalResult = _result * 100;
                              } else if(_fromUnit == 'm' && _toUnit == 'mm'){
                                _finalResult = _result * 1000;
                              } else if(_fromUnit == 'm' && _toUnit == 'nm'){
                                _finalResult = _result * 1000000000;
                              } else if(_fromUnit == 'm' && _toUnit == 'in'){
                                _finalResult = _result / 2.54 * 100;
                              } else if(_fromUnit == 'm' && _toUnit == 'ft'){
                                _finalResult = _result / 0.3048;
                              } else if(_fromUnit == 'm' && _toUnit == 'yd'){
                                _finalResult = _result / 0.9144;
                              } else if(_fromUnit == 'km' && _toUnit == 'km'){
                                _finalResult = _result * 1;
                              } else if(_fromUnit == 'km' && _toUnit == 'm'){
                                _finalResult = _result * 1000;
                              } else if(_fromUnit == 'km' && _toUnit == 'dm'){
                                _finalResult = _result * 10000 ;
                              } else if(_fromUnit == 'km' && _toUnit == 'cm'){
                                _finalResult = _result * 100000;
                              } else if(_fromUnit == 'km' && _toUnit == 'mm'){
                                _finalResult = _result * 1000000 ;
                              } else if(_fromUnit == 'km' && _toUnit == 'nm'){
                                _finalResult = _result * 1000000000000;
                              } else if(_fromUnit == 'km' && _toUnit == 'in'){
                                _finalResult = _result * 39370.07874;
                              } else if(_fromUnit == 'km' && _toUnit == 'ft'){
                                _finalResult = _result * 3280.8399 ;
                              } else if(_fromUnit == 'km' && _toUnit == 'yd'){
                                _finalResult = _result * 1093.61329834 ;
                              }
                            }
                          }
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: const Text('km'),
                          value: _toUnit,
                          items: _toMeasureItems.map(buildMenuItem).toList(),
                          onChanged: (value) {
                            setState(() {
                              _result = int.parse(_unitController.text);
                              this._toUnit = value;
                              unitsSelected = false;
                            });
                            if(_unitController.text != '' && _fromUnit.isNotEmpty  && _toUnit.isNotEmpty) {
                              unitsSelected = true;
                              if(_fromUnit == 'm' && _toUnit == 'm'){
                                _finalResult = _result * 1;
                              } else if(_fromUnit == 'm' && _toUnit == 'km'){
                                _finalResult = _result / 1000;
                              } else if(_fromUnit == 'm' && _toUnit == 'dm'){
                                _finalResult = _result / 10;
                              } else if(_fromUnit == 'm' && _toUnit == 'cm'){
                                _finalResult = _result * 100;
                              } else if(_fromUnit == 'm' && _toUnit == 'mm'){
                                _finalResult = _result * 1000;
                              } else if(_fromUnit == 'm' && _toUnit == 'nm'){
                                _finalResult = _result * 1000000000;
                              } else if(_fromUnit == 'm' && _toUnit == 'in'){
                                _finalResult = _result / 2.54 * 100;
                              } else if(_fromUnit == 'm' && _toUnit == 'ft'){
                                _finalResult = _result / 0.3048;
                              } else if(_fromUnit == 'm' && _toUnit == 'yd'){
                                _finalResult = _result / 0.9144;
                              } else if(_fromUnit == 'km' && _toUnit == 'km'){
                                _finalResult = _result * 1;
                              } else if(_fromUnit == 'km' && _toUnit == 'm'){
                                _finalResult = _result * 1000;
                              } else if(_fromUnit == 'km' && _toUnit == 'dm'){
                                _finalResult = _result * 10000 ;
                              } else if(_fromUnit == 'km' && _toUnit == 'cm'){
                                _finalResult = _result * 100000;
                              } else if(_fromUnit == 'km' && _toUnit == 'mm'){
                                _finalResult = _result * 1000000 ;
                              } else if(_fromUnit == 'km' && _toUnit == 'nm'){
                                _finalResult = _result * 1000000000000;
                              } else if(_fromUnit == 'km' && _toUnit == 'in'){
                                _finalResult = _result * 39370.07874;
                              } else if(_fromUnit == 'km' && _toUnit == 'ft'){
                                _finalResult = _result * 3280.8399 ;
                              } else if(_fromUnit == 'km' && _toUnit == 'yd'){
                                _finalResult = _result * 1093.61329834 ;
                              }
                            }}
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0,),
              Text((() {
                if(unitsSelected){
                  return '$_result $_fromUnit = $_finalResult $_toUnit';
                } return '';})(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ), textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}