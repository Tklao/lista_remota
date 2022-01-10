class Usuarios {
  late int id;
  late String name;
  late String email;

  Usuarios(this.id, this.name, this.email);

  Usuarios.fromJson(Map json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}
