import 'package:flutter/material.dart';
import 'package:ejercicios_01/navigation/Drawer.dart';

void main() {
  runApp(Ejercicios4App());
}

class Ejercicios4App extends StatelessWidget {
  const Ejercicios4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicios 04',
      theme: ThemeData(
        //primarySwatch: Colors.pink,
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 214, 162, 49),
          foregroundColor: Colors.white,
          elevation: 5,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 169, 175, 211),
          ),
        ),
      ),
      home: const Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EJERCICIO 04"),
        centerTitle: true,
      ),
      drawer: MiDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fondo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85), // Fondo blanco semi-transparente
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.school, color: Color.fromARGB(255, 175, 132, 14), size: 60),
                SizedBox(height: 16),
                Text(
                  "¡Bienvenido a los Ejercicios 4!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  "Usa el menú lateral para navegar entre los ejercicios disponibles.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
