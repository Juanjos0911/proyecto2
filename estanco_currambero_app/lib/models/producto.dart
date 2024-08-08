import 'dart:convert';


class Producto{
  final int id;
  final String nombre;
  final int cantidad;
  final String foto;

Producto({
    required this.id,
    required this.nombre,
    required this.cantidad,
    required this.foto,
  });
  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      nombre: json['nombre'],
      cantidad: json['cantidad'],
      foto: json['foto'],
    );
  }
}

List<Producto> userFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Producto>.from(jsonData.map((item) => Producto.fromJson(item)));
}