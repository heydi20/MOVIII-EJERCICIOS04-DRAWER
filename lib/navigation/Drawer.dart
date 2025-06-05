import 'package:ejercicios_01/main.dart';
import 'package:ejercicios_01/screens/Pantalla1Screen.dart';
import 'package:ejercicios_01/screens/Pantalla2Screen.dart';
import 'package:ejercicios_01/screens/Pantalla3Screen.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            children: [
              Text("EJERCICIOS 04")
            ],
          )),
          ListTile(
            title: Text("Home"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Ejercicios4App())),
          ),
          ListTile(
            title: Text("Ejercicio 1"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Ejercicio1())),
          ),
          ListTile(
            title: Text("Ejercicio 2"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Ejercicio2())),
          ),
          ListTile(
            title: Text("Ejercicio 3"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Ejercicio3())),
          )
        ],
      ),
    );
  }
}