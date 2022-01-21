import 'package:flutter/material.dart';

import 'package:utilitaire_flutter/models/MenuItem.dart';
import 'package:utilitaire_flutter/widgets/_DistanceConverterPage.dart';
import 'package:utilitaire_flutter/widgets/_FileSizePage.dart';
import 'package:utilitaire_flutter/widgets/userYears.dart';
import 'package:utilitaire_flutter/widgets/calculatePromotion.dart';
import 'package:utilitaire_flutter/widgets/dateDifference.dart';
import 'package:utilitaire_flutter/widgets/convertTemperature.dart';
import 'package:utilitaire_flutter/widgets/_AreaConverterPage.dart';
import 'package:utilitaire_flutter/widgets/_RomanNumerals.dart';
import 'package:utilitaire_flutter/widgets/NumericValueConvert.dart';

class HomePage extends StatefulWidget {
  static const tag = 'accueil';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _changeLayout = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Une super application")),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: _changeLayout ? GridView.count(
          crossAxisCount: 2,
          children: [
            // Affichage des différents utilitaires présent sur l'app
            // TODO: Mettre à jour les routes
            MenuItem('Distance', Icons.straighten , Colors.yellow, DistanceConverterPage.tag),
            MenuItem('Promotions', Icons.discount , Colors.orange, CalculatePromotion.tag),
            MenuItem('Anniversaire', Icons.cake , Colors.pink, UserYear.tag),
            MenuItem('Fichiers informatiques', Icons.folder , Colors.teal, FileSizePage.tag),
            MenuItem('Temps', Icons.timer , Colors.red, MyDateDifference.tag),
            MenuItem('Température', Icons.thermostat , Colors.purple, ConvertTemperatureForm.tag),
            MenuItem('Chiffres romains', Icons.numbers , Colors.green, RomanNumeralsPage.tag),
            MenuItem('Aire', Icons.widgets , Colors.lime, AreaConverterPage.tag),
            MenuItem('Valeurs numériques', Icons.computer , Colors.blue, NumericValueForm.tag),
          ],
        ) : ListView(
          children: [
            // Affichage des différents utilitaires présent sur l'app
            // TODO: Mettre à jour les routes
            MenuItem('Distance', Icons.straighten , Colors.yellow, DistanceConverterPage.tag),
            MenuItem('Promotions', Icons.discount , Colors.orange, CalculatePromotion.tag),
            MenuItem('Anniversaire', Icons.cake , Colors.pink, UserYear.tag),
            MenuItem('Fichiers informatiques', Icons.folder , Colors.teal, FileSizePage.tag),
            MenuItem('Temps', Icons.timer , Colors.red, MyDateDifference.tag),
            MenuItem('Température', Icons.thermostat , Colors.purple, ConvertTemperatureForm.tag),
            MenuItem('Chiffres romains', Icons.numbers , Colors.green, RomanNumeralsPage.tag),
            MenuItem('Aire', Icons.widgets , Colors.lime, AreaConverterPage.tag),
            MenuItem('Valeurs numériques', Icons.computer , Colors.blue, NumericValueForm.tag),
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child:
              Text(
                'Drawer Header',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0
                ),
              ),
            ),
            ListTile(
              title: const Text('Grid View'),
              onTap: () {
                // Update the state of the app
                setState(() {
                  _changeLayout = true;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('List View'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                setState(() {
                  _changeLayout = false;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
