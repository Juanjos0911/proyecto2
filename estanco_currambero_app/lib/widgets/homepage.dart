import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/producto.dart';
import 'animacion_cerveza.dart';
import 'datopage.dart';
import 'errorpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estanco Currambero'),),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return ErrorPage();
            }else if (snapshot.hasData) {
              return DatoPage(productos: snapshot.data as List<Producto>,);
            }
          }
          return AnimacionCerveza();
        },
        future: getList(),
      )
,
    );
  }

  Future<List<Producto>> getList() async {
    final response = await http.get(Uri.parse('https://c04e-179-19-64-43.ngrok-free.app/personajes'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Fallo al traer los datos');
    }
  }
}