import 'package:flutter/material.dart';
import 'package:utilitaire_flutter/widgets/_FileSizePage.dart';
import 'package:utilitaire_flutter/widgets/_HomePage.dart';
import 'package:utilitaire_flutter/widgets/_DistanceConverterPage.dart';
import 'package:utilitaire_flutter/widgets/userYears.dart';
import 'package:utilitaire_flutter/widgets/calculatePromotion.dart';
import 'package:utilitaire_flutter/widgets/dateDifference.dart';
import 'package:utilitaire_flutter/widgets/_AreaConverterPage.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utilitaire Flutter',
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.tag: (context) => HomePage(),
        DistanceConverterPage.tag: (context) => DistanceConverterPage(),
        UserYear.tag: (context) => UserYear(),
        FileSizePage.tag: (context) => FileSizePage(),
        CalculatePromotion.tag: (context) => CalculatePromotion(),
        MyDateDifference.tag: (context) => MyDateDifference(),
        AreaConverterPage.tag: (context) => AreaConverterPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}