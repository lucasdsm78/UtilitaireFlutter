import 'package:flutter/material.dart';
import 'NumericValue.dart';

class ConvertNumericValue {

  static const String bin = 'BIN';
  static const String oct = "OCT";
  static const String dec = 'DEC';
  static const String hex = 'HEX';

  final String numericValue;
  final String unit1;
  final String unit2;

  ConvertNumericValue(
      this.numericValue,
      this.unit1,
      this.unit2);

  String convertNumericValue() {

    // HEX TO BINARY
    if (unit1 == hex  && unit2 == bin) {
      return NumericValue(numericValue).HexToBin;
    }

    // HEX TO DECIMAL
    if (unit1== hex && unit2 == dec) {
      return NumericValue(numericValue).HexToDec;
    }

    //  HEX TO OCT
    if (unit1 == hex && unit2 == oct) {
      return NumericValue(numericValue).HexToOct;
    }

    // DEC TO HEX
    if (unit1 == dec && unit2 == hex) {
      return NumericValue(numericValue).DecToHex;
    }
    // DEC TO BIN
    if (unit1 == dec && unit2 == bin) {
      return NumericValue(numericValue).DecToBin;
    }

    // DEC TO OCT
    if (unit1 == dec && unit2 == oct) {
      return NumericValue(numericValue).DecToOct;
    }

    // OCT TO BIN
    if (unit1 == oct && unit2 == bin) {
      return NumericValue(numericValue).OctToBin;
    }

    // OCT TO HEX
    if (unit1 == oct && unit2 == hex) {
      return NumericValue(numericValue).OctToHex;
    }

    // OCT TO DEC
    if (unit1 == oct && unit2 == dec) {
      return NumericValue(numericValue).OctToDec;
    }
    // BIN TO DEC
    if (unit1 == bin && unit2 == dec) {
      return NumericValue(numericValue).BinToDec;
    }

    // BIN TO HEX
    if (unit1 == bin && unit2 == hex) {
      return NumericValue(numericValue).BinToHex;
    }

    // BIN TO OCT
    if (unit1 == bin && unit2 == oct) {
      return NumericValue(numericValue).BinToOct;
    }
    return '';
  }
}
