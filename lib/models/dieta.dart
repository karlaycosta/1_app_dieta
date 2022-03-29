import 'package:app_dieta/models/reativa.dart';
import 'package:app_dieta/models/refeicao.dart';

class Dieta extends Reativa<Refeicao> {
  static final Dieta _instance = Dieta._();

  Dieta._();

  factory Dieta() => _instance;
}
