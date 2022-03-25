import 'package:intl/intl.dart';

String formatarNumero(num valor) {
  return NumberFormat.decimalPattern().format(valor);
}