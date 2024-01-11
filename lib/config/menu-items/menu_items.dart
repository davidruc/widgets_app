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
    icon: Icons.credit_card)
];