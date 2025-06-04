import 'package:ejercicios_01/navigation/drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Calculadora de Propinas para Restaurante"),
      appBar: AppBar(),
      drawer: MiDrawer(),
    );
  }
}