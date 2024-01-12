//Vamos a llenar todo este archivo de enlaces 


import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String url;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.url, 
    required this.icon
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: "Botones", 
    subTitle: "Varios botones de flutter", 
    url: "/buttons",
    icon: Icons.smart_button_outlined),

    MenuItem(
    title: "Tarjetas", 
    subTitle: "Un contenedor estilizado", 
    url: "/card",
    icon: Icons.credit_card),

    MenuItem(
      title: "Progress Indicators", 
      subTitle: "Generales y controlados", 
      url: "/progress",
      icon: Icons.refresh_rounded
    ),

    MenuItem(
      title: "Snackbars y dialogs", 
      subTitle: "Indicadores en pantalla", 
      url: "/snackbars",
      icon: Icons.info_outline
    ),
     MenuItem(
      title: "Animated container", 
      subTitle: "Statefull widget animated", 
      url: "/animated",
      icon: Icons.check_box_outline_blank_outlined
    ),
];