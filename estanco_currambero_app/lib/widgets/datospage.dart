import 'package:flutter/material.dart';

import '../models/producto.dart';

class DatosPage extends StatelessWidget {
  final Producto producto;
  const DatosPage({
    Key? key, required this.producto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(producto.id.toString()),
        Text(producto.foto),
        Text(producto.nombre),
        Text("${producto.cantidad}"),
      ],
    );
  }
}