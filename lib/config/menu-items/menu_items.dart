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
      title: "Riverpod Counter", 
      subTitle: "Introduction to riverpol", 
      url: "/counter-river",
      icon: Icons.plus_one
    ),
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
    MenuItem(
      title: "UI-controlls", 
      subTitle: "Una serie de controllers de flutter", 
      url: "/uiControllos",
      icon: Icons.car_rental_rounded
    ),
    MenuItem(
      title: "Introduction to the App", 
      subTitle: "Breve tutorial de la aplicacion", 
      url: "/tutorial",
      icon: Icons.accessibility_new_outlined
    ),
    MenuItem(
      title: "Infinite Scroll", 
      subTitle: "Listas infinitas y pull to refresh", 
      url: "/infinite",
      icon: Icons.list_sharp
    ),
    MenuItem(
      title: "Cabiar tema", 
      subTitle: "Cambiar tema de la aplicacion", 
      url: "/theme-changer",
      icon: Icons.color_lens_outlined
    ),
    
];