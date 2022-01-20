import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDifference extends StatelessWidget {
  const DateDifference({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: MyDateDifference(),
    );
  }
}

class MyDateDifference extends StatefulWidget {

  @override
  State<MyDateDifference> createState() => _MyDateDifference();
}

class _MyDateDifference extends State<MyDateDifference> {

  DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  // Création d un Date Picker

  Future<void> _selectStartDate(BuildContext context) async {

    final picked = await showDatePicker(

        context: context,
        initialDate: _startDate,
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2200, 8)); // initialisation de la date bloqué à la date d'aujourd'hui

    if (picked != null) {

      setState(() {

        _startDate = picked;

      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {



    final picked = await showDatePicker(

        context: context,
        initialDate: _startDate,
        firstDate: _startDate,
        lastDate: DateTime(2200, 8)
    ); // initialisation de la date bloqué à la date d'aujourd'hui

    if (picked != null) {

      setState(() {

        _endDate = picked;

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("age utilisateur"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Récupérer les 2 dates',
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: (()=>_selectStartDate(context)),
                      child: const Text('Début'),
                    ),
                    Text(formatter.format(_startDate))
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: (()=>_selectEndDate(context)),
                      child: const Text('Fin'),
                    ),
                    Text(formatter.format(_endDate))
                  ],
                )
              ],
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: (()=>alerte()),
              child: const Text('Calculer'),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> alerte() async{


    var startYear = _startDate.year;
    var february = (startYear % 4 == 0 && startYear % 100 != 0) || startYear % 400 == 0 ? 29 : 28;
    var daysInMonth = [31, february, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    var yearDiff = _endDate.year - startYear;
    var monthDiff = _endDate.month - _startDate.month;
    if (monthDiff < 0) {
    yearDiff--;
    monthDiff += 12;
    }
    var dayDiff = _endDate.day - _startDate.day;
    if (dayDiff < 0) {
    if (monthDiff > 0) {
    monthDiff--;
    } else {
    yearDiff--;
    monthDiff = 11;
    }
    dayDiff += daysInMonth[_startDate.month];
    }

    print("Dans $yearDiff années,  $monthDiff mois et $dayDiff jours");


    return showDialog(
        context: context,
        barrierDismissible: false, //Permet d'empecher le dialog en cliquant sur la page en arrière plan
        builder: (BuildContext buildContext){
          return SimpleDialog(
            title: const Text("BONJOUR"),
            contentPadding: const EdgeInsets.all(20.0),
            children: [
            Text("Dans $yearDiff années,  $monthDiff mois et $dayDiff jours"),
              Container(
                height: 30,
              ),
              ElevatedButton(
                child: const Text("O K"),
                onPressed: (){
                  Navigator.pop(buildContext);
                },
              ),
            ],
          );

        }
    );
  }

}
