import 'package:ejercicios_01/navigation/drawer.dart';
import 'package:flutter/material.dart';

class Ejercico3 extends StatelessWidget {
  const Ejercico3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Simulador de ahorro mensual"),
      appBar: AppBar(),
      drawer: MiDrawer(),
    );
  }
}