// ignore_for_file: overridden_fields

import 'package:hasaptory/Model/styles_model.dart';
import 'package:flutter/material.dart';

class Texts {
  Text mainTitle = Text("Hasabat Tory", style: ThemeStyle().appBar);
}

class TextsDark extends Texts {
  @override
  Text mainTitle = Text("Hasabat Tory", style: ThemeDarkStyle().appBar);
}
