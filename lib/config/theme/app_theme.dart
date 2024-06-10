import 'package:flutter/material.dart';

// Custom color baby blue
const Color customColor = Color(0xFF00B0FF);

const List<Color> _colorThemes = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.indigo,
];


class AppTheme { 
  final int selectedColor; 

  AppTheme({this.selectedColor = 0}) : assert(selectedColor >= 0 && selectedColor < _colorThemes.length);
  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}