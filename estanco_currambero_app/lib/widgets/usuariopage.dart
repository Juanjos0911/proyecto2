import 'package:flutter/material.dart';

import '../models/usuario.dart';

class UsuarioPage extends StatelessWidget {
  final Usuario usuario;
  const UsuarioPage({
    Key? key, required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(usuario.id.toString()),
        Text(usuario.foto),
        Text(usuario.nombre),
      ],
    );
  }
}