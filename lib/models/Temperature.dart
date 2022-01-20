class Temperature {
  final double temperature;

  Temperature(this.temperature);

  // KELVIN TO FARENHEIT
  double get KelvinToFarenheit {
    return (temperature - 273.15) * (9 / 5) + 32;
  }

  // KELVIN TO CELSIUS
  double get KelvinToCelsius {
    return temperature - 273.15;
  }

  // CELSIUS TO KELVIN
  double get CelsiusToKelvin {
    return 273.15 + temperature;
  }

  // CELSIUS TO FARENHEIT
  double get CelsiusToFarenheit {
    return (temperature * (9 / 5)) + 32;
  }

  // FARENHEIT TO KELVIN
  double get FarenheitToKelvin {
    return (temperature - 32) * (5 / 9) + 273.15;
  }

  // FARENHEIT TO CELSIUS
  double get FarenheitToCelsius {
    return (temperature - 32) * (5 / 9);
  }
}
