import 'package:ejercicios_01/navigation/drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Calculadora de interés simple"),
      appBar: AppBar(),
      drawer: MiDrawer(),
    );
  }
}