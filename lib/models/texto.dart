import 'package:flutter/cupertino.dart';

class Texto extends ValueNotifier<String> {
  Texto({String? value}) : super(value ?? '');
}