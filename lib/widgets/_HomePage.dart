import 'package:flutter/material.dart';

import 'package:utilitaire_flutter/models/MenuItem.dart';
import 'package:utilitaire_flutter/widgets/_DistanceConverterPage.dart';
import 'package:utilitaire_flutter/widgets/_FileSizePage.dart';
import 'package:utilitaire_flutter/widgets/userYears.dart';
import 'package:utilitaire_flutter/widgets/calculatePromotion.dart';
import 'package:utilitaire_flutter/widgets/dateDifference.dart';

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
            MenuItem('Distance', Icons.straighten , Colors.yellow, DistanceConverterPage.tag),
            MenuItem('Promotions', Icons.discount , Colors.orange, CalculatePromotion.tag),
            MenuItem('Anniversaire', Icons.cake , Colors.pink, UserYear.tag),
            MenuItem('Temps', Icons.timer , Colors.red, MyDateDifference.tag),
            MenuItem('Informatique', Icons.folder , Colors.teal, FileSizePage.tag),
            MenuItem('Température', Icons.thermostat , Colors.purple, HomePage.tag),
            MenuItem('Chiffres romains', Icons.numbers , Colors.green, HomePage.tag),
          ],
        ),
      ),
    );
  }
}
