import 'package:hasaptory/View/Pages/page_table.dart';

import '/View/Pages/page_home.dart';
import 'package:flutter/material.dart';

import '../View/Pages/page_logo.dart';

class Rout {
  // Home never change!!!
  static const String home = "/HomePage";
  static const String logo = "/LogoPage";
  static const String table = "/TablePage";

  static Map<String, Widget Function(dynamic)> pages = {
    logo: (context) => const LogoPage(),
    home: (context) => const HomePage(),
    table: (context) => TablePage(),
  };
}
