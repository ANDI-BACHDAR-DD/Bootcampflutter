class Titan {
  late double _powerPoint;

  // Setter untuk mengatur nilai power point
  void setPowerPoint(double value) {
    _powerPoint = value < 5 ? 5 : value; // Minimal nilai powerPoint adalah 5
  }

  // Getter untuk mengambil nilai power point
  double getPowerPoint() {
    return _powerPoint;
  }
}
