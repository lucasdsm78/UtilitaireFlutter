import 'package:flutter/material.dart';

import 'package:utilitaire_flutter/models/MenuItem.dart';
import 'package:utilitaire_flutter/widgets/_DistanceConverterPage.dart';
import 'package:utilitaire_flutter/widgets/userYears.dart';

class HomePage extends StatefulWidget {
  static const tag = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            // Affichage des différents utilitaires présent sur l'app
            // TODO: Mettre à jour les routes
            MenuItem('Accueil', Icons.home , Colors.blueGrey, HomePage.tag),
            MenuItem('Distance', Icons.straighten , Colors.yellow, DistanceConverterPage.tag),
            MenuItem('Anniversaire', Icons.cake , Colors.pink, UserYear.tag),
            MenuItem('Informatique', Icons.folder , Colors.teal, DistanceConverterPage.tag),
            MenuItem('Température', Icons.thermostat , Colors.purple, DistanceConverterPage.tag),
            MenuItem('Chiffres romains', Icons.numbers , Colors.green, DistanceConverterPage.tag),
            MenuItem('Calendrier', Icons.date_range , Colors.red, DistanceConverterPage.tag),
          ],
        ),
      ),
    );
  }
}
