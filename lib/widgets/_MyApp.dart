import 'package:flutter/material.dart';
import 'package:utilitaire_flutter/widgets/_HomePage.dart';
import 'package:utilitaire_flutter/widgets/_DistanceConverterPage.dart';
import 'package:utilitaire_flutter/widgets/userYears.dart';

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
      },
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}