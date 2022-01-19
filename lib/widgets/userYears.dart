import 'package:flutter/material.dart';

class UserYear extends StatefulWidget {
  static const tag = 'birthday_page';

  @override
  State<UserYear> createState() => _MyUserYear();
}

class _MyUserYear extends State<UserYear> {


  DateTime selectedDate = DateTime.now();
  late int days;
  late double years;
  late int hours;
  late DateTime birthday;

 // Création d un Date Picker

  Future<void> _selectDate(BuildContext context) async {

    DateTime currentDate = DateTime.now();

    final picked = await showDatePicker(

        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1800, 8),
        lastDate: currentDate); // initialisation de la date bloqué à la date d'aujourd'hui

    if (picked != null) {

      setState(() {

        // initialisation des states

      selectedDate = picked;

      // recupére le nombre de jours et d'heures entre la date sélectionné et la date d'aujourdhui

      days = selectedDate.difference(currentDate).inDays.abs();
      hours = selectedDate.difference(currentDate).inHours.abs();
      years = days / 365;

      // instancie la date d'anniversaire

      birthday = DateTime(currentDate.year,selectedDate.month,selectedDate.day);

      if(birthday.isBefore(currentDate)){

        birthday = birthday.add(const Duration(days: 365)); // rajoute 1 an si date d'anniversaire inferieure à date d'aujourdhui

      }

      var startYear = currentDate.year;
      var february = (startYear % 4 == 0 && startYear % 100 != 0) || startYear % 400 == 0 ? 29 : 28; //récupère le nombre de jour en fonction de l'année (si bissextile) de février

      var daysInMonth = [31, february, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
      var monthDiff = birthday.month - currentDate.month;

      if (monthDiff < 0) {
        monthDiff += 12;
      }

      var dayDiff = birthday.day - currentDate.day;

      if (dayDiff < 0) {

        if (monthDiff > 0) {
          monthDiff--;
        } else {
          monthDiff = 11;
        }
        dayDiff += daysInMonth[currentDate.month];
      }
      //recupére le nombre de mois et de jours entre la date d'aujourdhui et le prochain anniversaire

      int months = years.toInt() * 12;
      int monthsleft = 11 - monthDiff;
      monthsleft = months + monthsleft;

      //récupère le nombre de mois depuis la date de naissance

      print(monthsleft);
      print("${monthDiff} + 'M ' + ${dayDiff} + 'D'");

      alerte(days,hours,years,monthDiff,dayDiff,monthsleft);

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
              'Entrez votre date de naissance',
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: (()=>_selectDate(context)),
              child: const Text('choisir'),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> alerte(int days,int hours,double years,int monthDiff,int dayDiff,int monthsLeft) async{
    return showDialog(
        context: context,
        barrierDismissible: false,//Permet d'empecher le dialog en cliquant sur la page en arrière plan
        builder: (BuildContext buildContext){
          return SimpleDialog(
            title: const Text("BONJOUR"),
            contentPadding: const EdgeInsets.all(20.0),
            children: [
              Text("Vous avez ${years.toInt()} ans"),
              Text("Vous avez $monthsLeft mois"),
              Text("Vous avez $days jours"),
              Text("Vous avez $hours heures"),
              Text("Votre anniversaire est dans $monthDiff mois et $dayDiff jours"),
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

