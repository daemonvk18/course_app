import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideBar {
  late String title; //we can mark it late if it is showing non-nullable error.
  late Icon icon;
  late LinearGradient background;

  SideBar(
      {required String title,
      required Icon icon,
      required LinearGradient background}) {
    this.title = title;
    this.icon = icon;
    this.background = background;
  }
}

var sideBaritem = [
  SideBar(
    title: "Home",
    icon: Icon(
      Icons.home,
      color: Colors.white,
    ),
    background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF00AEFF),
          Color(0xFF0076FF),
        ]),
  ),
  SideBar(
    title: "Courses",
    icon: Icon(
      Platform.isAndroid ? Icons.library_books : CupertinoIcons.book_solid,
      color: Colors.white,
    ),
    background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFA7d75),
          Color(0xFFC23D61),
        ]),
  ),
  SideBar(
    title: "Billing",
    icon: Icon(
      Icons.credit_card,
      color: Colors.white,
    ),
    background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFAD64A),
          Color(0xFFEA880F),
        ]),
  ),
  SideBar(
    title: "Settings",
    icon: Icon(
      Icons.settings,
      color: Colors.white,
    ),
    background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF4E62CC),
          Color(0xFF202A78),
        ]),
  )
];
