import 'dart:core';
import 'dart:math';

class NumericValue {
  final String numericValue;

  NumericValue(this.numericValue);

  // HEX TO BIN
  String get HexToBin {
    BigInt binary = BigInt.parse(numericValue,radix: 16);
    return binary.toString();
  }

  // HEX TO DEC
  String get HexToDec {
    int hexa = int.parse(numericValue, radix: 16);
    return hexa.toString();
  }

  //HEX TO OCT
  String get HexToOct {
    return '';
  }

  // DEC TO HEX
  String get DecToHex {
    int decimal = int.parse(numericValue);
    return decimal.toRadixString(16);
  }

  //DEC TO BIN
  String get DecToBin {

    int bin = 0;
    int i = 1;
    int decimal = int.parse(numericValue);
    while(decimal > 0)
    {
      bin = bin + (decimal % 2)*i;
      decimal = (decimal/2).floor();
      i = i * 10;
    }
    return bin.toString();
  }

  // DEC TO OCT
  String get DecToOct {
    var listNum = [];
    int i = 0;
    int decimal = int.parse(numericValue);
    while(decimal != 0) {
      listNum.insert(i, decimal % 8);
      i++;
      decimal = (decimal/8).toInt();
    }
    num a = 0;
    for(i=(i-1); i>=0; i--) {
      a = a * 10 + listNum[i];
    }
    return a.toString();
  }

  // OCT TO DEC
  String get OctToDec {
   int p = 0;
   double decimal = 0;
   double value = double.parse(numericValue);

   while(value != 0) {
     decimal += (value%10) * pow(8, p);
     p++;
     value/=10;
   }
   return decimal.toString();
  }

  // OCT TO BIN
  String get OctToBin {
    double octal = double.parse(numericValue);
    double dec = 0;
    int i = 0;
    double bin = 0;

    // convert octal to decimal
    while(octal != 0) {
      dec += (octal % 10) * pow(8, i);
      i++;
      octal /= 10;
    }
    i = 1;

    // convert decimal to binary
    while(dec != 0) {
      bin += (dec % 2) * i;
      dec /= 2;
      i *= 10;
    }
    return bin.toString();
  }

  // OCT TO HEX
  String get OctToHex {
    return '';
  }


  // BIN TO DEC
  String get BinToDec {
    int result = int.parse(numericValue, radix: 2);
    return result.toString();
  }

  // BIN TO HEX
  String get BinToHex {
    double hexadecimal = 0;
    int i = 1;
    double remainder;
    double bin = double.parse(numericValue);
    while(bin != 0) {
      remainder = bin % 10;
      hexadecimal = hexadecimal + remainder * i;
      i = i * 2;
      bin = bin / 10;
    }
    return hexadecimal.round().toString();
  }

  String get BinToOct {
    double oct = 0;
    int i = 0;
    double dec = 0;
    double bin = double.parse(numericValue);

    while(bin != 0) {
      dec += (bin % 10) * pow(2, i);
      i++;
      bin /= 10;
    }
    while(dec != 0) {
      oct += (dec % 8) *i;
      dec /= 8;
      i*=10;
    }
    return oct.toString();
  }
}
