import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AreaConverterPage extends StatefulWidget {
  static const tag = 'aire';

  @override
  _AreaConverterPageState createState() => _AreaConverterPageState();
}

class _AreaConverterPageState extends State<AreaConverterPage> {

  // 2 tableaux pour alimenter les dropdown
  final _fromMeasureItems = ['m²','km²'];
  final _toMeasureItems = ['m²','km²','cm²','ha','ac'];

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
        title: const Text('Convertisseur d\'aires'),
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
                      if(_fromUnit == 'm²' && _toUnit == 'm²'){
                        _finalResult = _result * 1;
                      } else if(_fromUnit == 'm²' && _toUnit == 'km²'){
                        _finalResult = _result * 1e-6;
                      } else if(_fromUnit == 'm²' && _toUnit == 'cm²'){
                        _finalResult = _result * 10000;
                      } else if(_fromUnit == 'm²' && _toUnit == 'ha'){
                        _finalResult = _result / 10000;
                      } else if(_fromUnit == 'm²' && _toUnit == 'ac'){
                        _finalResult = _result * 0.00024710538149159;
                      } else if(_fromUnit == 'km²' && _toUnit == 'km²'){
                        _finalResult = _result * 1;
                      } else if(_fromUnit == 'km²' && _toUnit == 'm²'){
                        _finalResult = _result * 1000000;
                      } else if(_fromUnit == 'km²' && _toUnit == 'cm²'){
                        _finalResult = _result * 10000000000 ;
                      } else if(_fromUnit == 'km²' && _toUnit == 'ha'){
                        _finalResult = _result * 100;
                      } else if(_fromUnit == 'km²' && _toUnit == 'ac'){
                        _finalResult = _result * 247.10538 ;
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
                          hint: const Text('m²',),
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
                              if(_fromUnit == 'm²' && _toUnit == 'm²'){
                                _finalResult = _result * 1;
                              } else if(_fromUnit == 'm²' && _toUnit == 'km²'){
                                _finalResult = _result * 1e-6;
                              } else if(_fromUnit == 'm²' && _toUnit == 'cm²'){
                                _finalResult = _result * 10000;
                              } else if(_fromUnit == 'm²' && _toUnit == 'ha'){
                                _finalResult = _result / 10000;
                              } else if(_fromUnit == 'm²' && _toUnit == 'ac'){
                                _finalResult = _result * 0.00024710538149159;
                              } else if(_fromUnit == 'km²' && _toUnit == 'km²'){
                                _finalResult = _result * 1;
                              } else if(_fromUnit == 'km²' && _toUnit == 'm²'){
                                _finalResult = _result * 1000000;
                              } else if(_fromUnit == 'km²' && _toUnit == 'cm²'){
                                _finalResult = _result * 10000000000 ;
                              } else if(_fromUnit == 'km²' && _toUnit == 'ha'){
                                _finalResult = _result * 100;
                              } else if(_fromUnit == 'km²' && _toUnit == 'ac'){
                                _finalResult = _result * 247.10538 ;
                              }
                            }
                          }
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: const Text('km²'),
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
                              if(_fromUnit == 'm²' && _toUnit == 'm²'){
                                _finalResult = _result * 1;
                              } else if(_fromUnit == 'm²' && _toUnit == 'km²'){
                                _finalResult = _result * 1e-6;
                              } else if(_fromUnit == 'm²' && _toUnit == 'cm²'){
                                _finalResult = _result * 10000;
                              } else if(_fromUnit == 'm²' && _toUnit == 'ha'){
                                _finalResult = _result / 10000;
                              } else if(_fromUnit == 'm²' && _toUnit == 'ac'){
                                _finalResult = _result * 0.00024710538149159;
                              } else if(_fromUnit == 'km²' && _toUnit == 'km²'){
                                _finalResult = _result * 1;
                              } else if(_fromUnit == 'km²' && _toUnit == 'm²'){
                                _finalResult = _result * 1000000;
                              } else if(_fromUnit == 'km²' && _toUnit == 'cm²'){
                                _finalResult = _result * 10000000000 ;
                              } else if(_fromUnit == 'km²' && _toUnit == 'ha'){
                                _finalResult = _result * 100;
                              } else if(_fromUnit == 'km²' && _toUnit == 'ac'){
                                _finalResult = _result * 247.10538 ;
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