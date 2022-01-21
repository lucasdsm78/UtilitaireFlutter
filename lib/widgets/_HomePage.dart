import 'package:flutter/material.dart';

import 'package:utilitaire_flutter/models/MenuItem.dart';
import 'package:utilitaire_flutter/widgets/_DistanceConverterPage.dart';
import 'package:utilitaire_flutter/widgets/_FileSizePage.dart';
import 'package:utilitaire_flutter/widgets/userYears.dart';
import 'package:utilitaire_flutter/widgets/calculatePromotion.dart';
import 'package:utilitaire_flutter/widgets/dateDifference.dart';
import 'package:utilitaire_flutter/widgets/_AreaConverterPage.dart';

class HomePage extends StatefulWidget {
  static const tag = 'home_page';
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
            MenuItem('Temps', Icons.timer , Colors.red, MyDateDifference.tag),
            MenuItem('Informatique', Icons.folder , Colors.teal, FileSizePage.tag),
            MenuItem('Température', Icons.thermostat , Colors.purple, HomePage.tag),
            MenuItem('Chiffres romains', Icons.numbers , Colors.green, HomePage.tag),
            MenuItem('Aire', Icons.widgets , Colors.lime, AreaConverterPage.tag),
          ],
        ) : ListView(
          children: [
            // Affichage des différents utilitaires présent sur l'app
            // TODO: Mettre à jour les routes
            MenuItem('Distance', Icons.straighten , Colors.yellow, DistanceConverterPage.tag),
            MenuItem('Promotions', Icons.discount , Colors.orange, CalculatePromotion.tag),
            MenuItem('Anniversaire', Icons.cake , Colors.pink, UserYear.tag),
            MenuItem('Temps', Icons.timer , Colors.red, MyDateDifference.tag),
            MenuItem('Informatique', Icons.folder , Colors.teal, FileSizePage.tag),
            MenuItem('Température', Icons.thermostat , Colors.purple, HomePage.tag),
            MenuItem('Chiffres romains', Icons.numbers , Colors.green, HomePage.tag),
            MenuItem('Aire', Icons.widgets , Colors.lime, AreaConverterPage.tag),
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
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Grid View'),
              onTap: () {
                // Update the state of the app
                // ...
                setState(() {
                  _changeLayout = true;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Line View'),
              onTap: () {
                // Update the state of the app
                // ...
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
