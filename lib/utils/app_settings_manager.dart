import 'package:flutter/material.dart';

class AppSettingsManager extends ChangeNotifier {
  Locale _currentLocale = const Locale('en');
  double _textScaleFactor = 1.0;
  double _brightness = 1.0;

  // Getters
  Locale get currentLocale => _currentLocale;
  double get textScaleFactor => _textScaleFactor;
  double get brightness => _brightness;

  // Setters with notifyListeners
  void changeLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }

  void changeFontSize(double scale) {
    _textScaleFactor = scale;
    notifyListeners();
  }

  void changeBrightness(double brightness) {
    _brightness = brightness;
    notifyListeners();
  }
}
