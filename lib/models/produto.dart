class Produto {
  final int id;
  final String nome;
  final String descricao;
  final String preco;
  final String imagemUrl;
  final String conteudo;
  final String ref;
  final String idade;

  Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.imagemUrl,
    required this.conteudo,
    required this.ref,
    required this.idade,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      preco: json['preco'],
      imagemUrl: json['imagemUrl'],
      conteudo: json['conteudo'],
      ref: json['ref'],
      idade: json['idade'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'preco': preco,
      'imagemUrl': imagemUrl,
      'conteudo': conteudo,
      'ref': ref,
      'idade': idade,
    };
  }
}