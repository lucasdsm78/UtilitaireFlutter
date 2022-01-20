import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FileSizePage extends StatefulWidget {
  static const tag = 'file_size_page';

  @override
  _FileSizePageState createState() => _FileSizePageState();
}

class _FileSizePageState extends State<FileSizePage> {

  // 2 tableaux pour alimenter les dropdown
  final _fromMeasureItems = ['o','Ko'];
  final _toMeasureItems = ['o','Ko','Mo','Go','To','Po'];

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
        title: const Text('Convertir taille de fichiers informatique'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: const Text('o',),
                            value: _fromUnit,
                            items: _fromMeasureItems.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              this._fromUnit = value;
                              unitsSelected = false;
                            }),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: const Text('Ko'),
                            value: _toUnit,
                            items: _toMeasureItems.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              this._toUnit = value;
                              unitsSelected = false;
                            }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                      minimumSize: MaterialStateProperty.all(const Size(200, 40))
                  ),
                  onPressed: () {
                    setState(() {
                      _result = int.parse(_unitController.text);
                    });
                    // Vérifie si la saisie de l'utilisateur est complète
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
                    };
                  },
                  child: const Text('Convertir'),
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
              const SizedBox(height: 150.0,),
            ],
          ),
        ),
      ),
    );
  }
}
