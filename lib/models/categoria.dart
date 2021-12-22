class Categoria {
  final int? id; // Chave primária da categoria
  final String nome; // Nome da categoria
  final String? descricao; // Uma descrição da categoria
  final DateTime criacao; // Data e hora da criação do registro
  final DateTime? atualizacao; // Data e hora da última atualização do registro

  Categoria({
    this.id,
    required this.nome,
    this.descricao,
    required this.criacao,
    this.atualizacao,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'],
      nome: json['category'],
      descricao: json['descricao'],
      criacao:
          DateTime.parse(json['criacao'] ?? DateTime.now().toIso8601String()),
      atualizacao: json['atualizacao'] != null
          ? DateTime.parse(json['atualizacao'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final res = <String, dynamic>{};
    res.addAll(id != null ? {'id': id} : {});
    res.addAll({
      'nome': nome,
      'descricao': descricao,
      'criacao': criacao.toIso8601String(),
      'atualizacao': atualizacao?.toIso8601String(),
    });
    return res;
  }

  @override
  String toString() {
    return 'ID: ${id ?? '*'} - $nome';
  }
}
