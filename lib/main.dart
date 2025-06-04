import 'package:ejercicios_01/navigation/Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(Ejercicios4App());
}

class Ejercicios4App extends StatelessWidget {
  const Ejercicios4App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EJERCICIO 04"),centerTitle: true,),
      body: Container(
        child: Center(
          
        ),
      ),
      drawer: MiDrawer(),
    );
  }
}