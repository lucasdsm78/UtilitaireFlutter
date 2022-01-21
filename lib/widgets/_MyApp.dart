import 'package:flutter/material.dart';
import 'package:utilitaire_flutter/widgets/_FileSizePage.dart';
import 'package:utilitaire_flutter/widgets/_HomePage.dart';
import 'package:utilitaire_flutter/widgets/_DistanceConverterPage.dart';
import 'package:utilitaire_flutter/widgets/userYears.dart';
import 'package:utilitaire_flutter/widgets/calculatePromotion.dart';
import 'package:utilitaire_flutter/widgets/dateDifference.dart';
import 'package:utilitaire_flutter/widgets/_AreaConverterPage.dart';
import 'package:utilitaire_flutter/widgets/NumericValueConvert.dart';
import 'package:utilitaire_flutter/widgets/convertTemperature.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utilitaire Flutter',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.tag:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case CalculatePromotion.tag:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => CalculatePromotion(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case MyDateDifference.tag:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => MyDateDifference(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case AreaConverterPage.tag:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => AreaConverterPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case DistanceConverterPage.tag:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => DistanceConverterPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case UserYear.tag:
        return PageRouteBuilder(
          transitionDuration: const Duration(seconds:1),
          pageBuilder: (context, animation, secondaryAnimation) => UserYear(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      case FileSizePage.tag:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => FileSizePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      case NumericValueForm.tag:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => NumericValueForm(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      case ConvertTemperatureForm.tag:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => ConvertTemperatureForm(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }

}
