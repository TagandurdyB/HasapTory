// ignore_for_file: overridden_fields

import '/ViewModel/size_vm.dart';
import 'package:flutter/material.dart';

class ThemeStyle {
  TextStyle appBar =
      TextStyle(color: Colors.black, fontSize: MySize.arentir * 0.05);
}

class ThemeDarkStyle extends ThemeStyle {
  @override
  TextStyle appBar = TextStyle(color: Colors.white,fontSize: MySize.arentir * 0.05);
}
