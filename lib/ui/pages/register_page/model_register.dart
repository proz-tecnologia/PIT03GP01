class UserModel {
  String nome;
  String email;
  String profissao;
  double telefone;
  double renda;

  UserModel(
      {required this.email,
      required this.nome,
      required this.profissao,
      required this.renda,
      required this.telefone});
}
