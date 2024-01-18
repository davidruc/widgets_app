import 'package:flutter/material.dart';

//! Por ahora lo vamos a crear constante pero después vamos a permitir que estos colores se vayan editando en tiempo de ejecución del programa
const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.deepPurple,
  Colors.purple,
  Colors.pink,
  Colors.orange
];


class AppTheme {

  AppTheme({
    this.isDarkMode = false,
    this.selectedColor = 0
  }): assert( selectedColor >= 0, 'Selected Color must be greater than 0' ),
      assert( selectedColor < colorList.length, 'Selected Color must be less or equal than ${colorList.length - 1}' ); 
  
  final int selectedColor;
  final bool isDarkMode;

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode? Brightness.dark : Brightness.light ,
    colorSchemeSeed: colorList[ selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    ),
  );




}