import 'package:flutter/material.dart';
import 'Temperature.dart';

class ConvertTemperature {

  static const String c = 'C';
  static const String k = "K";
  static const String f = 'F';

  final double temperatureValue;
  final String unit1;
  final String unit2;

  ConvertTemperature(
      this.temperatureValue,
      this.unit1,
      this.unit2);

  double convertTemperature() {

      // KELVIN TO CELSIUS
      if (unit1.toString() == k && unit2.toString() == c) {
        return Temperature(temperatureValue).KelvinToCelsius;
      }

      // KELVIN TO FARENHEIT
      if (unit1.toString() == k && unit2.toString() == f) {
        return Temperature(temperatureValue).KelvinToFarenheit;
      }

      //  CELSIUS TO KELVIN
      if (unit1.toString() == c && unit2.toString() == k) {
        return Temperature(temperatureValue).CelsiusToKelvin;
      }

      // CELSIUS TO FARENHEIT
      if (unit1.toString() == c && unit2.toString() == f) {
        return Temperature(temperatureValue).CelsiusToFarenheit;
      }
      // FARENHEIT TO CELSIUS
      if (unit1.toString() == f && unit2.toString() == c) {
        return Temperature(temperatureValue).FarenheitToCelsius;
      }

      // FARENHEIT TO KELVIN
      if (unit1.toString() == f && unit2.toString() == k) {
        return Temperature(temperatureValue).FarenheitToKelvin;
      }

    return 0;
  }
}
