class Usuario{
  String? login;
  String? nome;
  String? email;
  String? token;
  List<String>? roles;
  
  //lista de inicialização
  Usuario.fromJson(Map<String, dynamic> map):
    nome = map["nome"],
    email = map["email"],
    token = map["token"],
    roles = (map["roles"] !=null) 
           ? map["roles"].map<String>((role)=>role.toString()).toList()
           :null,
    login = map["login"];


  @override
  String toString() {
    return 'Usuario {login: $login , nome: $nome , roles: $roles}';
  }

}