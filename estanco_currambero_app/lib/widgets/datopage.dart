import 'package:flutter/material.dart';

import '../models/producto.dart';
import 'datospage.dart';


class DatoPage extends StatelessWidget {
  final List<Producto> productos;
  const DatoPage({
    Key? key,required this.productos
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productos.length,
      itemBuilder: (context, index){
        final producto = productos[index];
        return ListTile(
          leading: Image.network(producto.foto),
          trailing:IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DatosPage(producto: producto),
                ),
              );
            },
          ),
          title: Text('id: ${producto.id}'  'Nombre: ${producto.nombre}'),
          subtitle: Text('cantidad: ${producto.cantidad}'),
        );
      }
    );
  }
}