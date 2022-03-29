import 'package:app_dieta/models/info_nutricional.dart';

class Alimento implements InfoNutricional{
  final int? id; // Chave primária do alimeto
  final String nome; // Nome do alimento
  final int categoria; // Chave estrangeira da categoria do alimento
  @override
  final double qtd; // Quantidade em gramas do alimeto
  @override
  final double proteinas; // Quantidade em gramas de proteína
  @override
  final double carboidratos; // Quantidade em gramas de carboidrato
  @override
  final double gorduras; // Quantidade em gramas de gordura
  @override
  final double? gSaturadas; // Quantidade em gramas de gordura sturada
  @override
  final double? gTrans; // Quantidade em gramas de gordura trans
  @override
  final double? fibras; // Quantidade em gramas de fibra
  @override
  final double? sodio; // Quantidade em miligramas de sódio
  final DateTime criacao; // Data e hora da criação do registro
  final DateTime? atualizacao; // Data e hora da última atualização do registro

  double get proteinaR => _arredondar(proteinas);
  double get carboidratoR => _arredondar(carboidratos);
  double get gorduraR => _arredondar(gorduras);

  // Propiedade calculada
  @override
  double get calorias {
    final p = proteinas == 0 ? 1.0 : proteinas;
    final c = carboidratos == 0 ? 1.0 : carboidratos;
    final g = gorduras == 0 ? 1.0 : gorduras;
    return double.parse(((p + c * 4) + (g * 9)).toStringAsFixed(2));
  }

  String get info {
    return 'Pro: ${proteinas}g | Car: ${carboidratos}g | Gor: ${gorduras}g';
  }

  Alimento({
    this.id,
    required this.nome,
    this.qtd = 100,
    required this.categoria,
    this.proteinas = 0,
    this.carboidratos = 0,
    this.gorduras = 0,
    this.gSaturadas,
    this.gTrans,
    this.fibras,
    this.sodio,
    required this.criacao,
    this.atualizacao,
  });

  Map<String, dynamic> toJson() {
    final res = <String, dynamic>{};
    res.addAll(id != null ? {'id': id} : {});
    res.addAll({
      'nome': nome,
      'qtd': qtd,
      'categoria': categoria,
      'proteina': proteinas,
      'carboidrato': carboidratos,
      'gordura': gorduras,
      'g_saturada': gSaturadas,
      'g_trans': gTrans,
      'fibra': fibras,
      'sodio': sodio,
      'criacao': criacao.toIso8601String(),
      'atualizacao': atualizacao?.toIso8601String(),
    });
    return res;
  }

  factory Alimento.fromJson(Map<String, dynamic> json) {
    return Alimento(
      id: json['id'],
      nome: json['nome'],
      qtd: json['qtd'].toDouble(),
      categoria: json['categoria'],
      proteinas: json['proteina'].toDouble(),
      carboidratos: json['carboidrato'].toDouble(),
      gorduras: json['gordura'].toDouble(),
      gSaturadas: json['g_saturada']?.toDouble(),
      gTrans: json['g_trans']?.toDouble(),
      fibras: json['fibra']?.toDouble(),
      sodio: json['sodio']?.toDouble(),
      criacao: DateTime.parse(json['criacao']),
      atualizacao: json['atualizacao'] != null
          ? DateTime.parse(json['atualizacao'])
          : null,
    );
  }

  double _arredondar(double valor) {
    return double.parse(valor.toStringAsFixed(2));
  }

  @override
  String toString() {
    return 'ID: ${id ?? '*'} - $nome\nQuantidade: ${qtd}g\nProteina: ${proteinas}g\nCarboidrato: ${carboidratos}g\nGordura: ${gorduras}g\ng - Saturada: ${gSaturadas}g\n - Trans: ${gTrans}g\nFibra: ${fibras}g\nSódio: ${sodio}mg\n';
  }

  Alimento copyWith({required double qtd}) {
    return Alimento(
      id: id,
      nome: nome,
      qtd: qtd,
      categoria: categoria,
      proteinas: (proteinas * qtd) / this.qtd,
      carboidratos: (carboidratos * qtd) / this.qtd,
      gorduras: (gorduras * qtd) / this.qtd,
      gSaturadas:
          gSaturadas == null ? null : (gSaturadas! * qtd) / this.qtd,
      gTrans: gTrans == null ? null : (gTrans! * qtd) / this.qtd,
      fibras: fibras == null ? null : (fibras! * qtd) / this.qtd,
      sodio: sodio == null ? null : (sodio! * qtd) / this.qtd,
      criacao: criacao,
      atualizacao: atualizacao,
    );
  }
}
