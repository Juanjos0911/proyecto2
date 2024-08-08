import 'dart:convert';


class Usuario{
  final int id;
  final String nombre;
  final String foto;

Usuario({
    required this.id,
    required this.nombre,
    required this.foto,
  });
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nombre: json['nombre'],
      foto: json['foto'],
    );
  }
}

List<Usuario> userFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Usuario>.from(jsonData.map((item) => Usuario.fromJson(item)));
}