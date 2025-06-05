import 'package:ejercicios_01/navigation/drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de interés simple"),
        centerTitle: true,
      ),
      drawer: MiDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fondo2.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
          ),
        ),
        child: const Center(
          child: InteresForm(), // Se define abajo
        ),
      ),
    );
  }
}

class InteresForm extends StatefulWidget {
  const InteresForm({super.key});

  @override
  State<InteresForm> createState() => _InteresFormState();
}

class _InteresFormState extends State<InteresForm> {
  final capitalController = TextEditingController();
  final tasaController = TextEditingController();
  final tiempoController = TextEditingController();

  String resultado = "";

  void calcularInteres() {
    final capital = double.tryParse(capitalController.text);
    final tasa = double.tryParse(tasaController.text);
    final tiempo = double.tryParse(tiempoController.text);

    if (capital == null || tasa == null || tiempo == null ||
        capital <= 0 || tasa <= 0 || tiempo <= 0) {
      mostrarAlerta("Todos los valores deben ser numéricos y positivos.");
      return;
    }

    final montoFinal = capital * (1 + (tasa * tiempo / 100));
    final interes = montoFinal - capital;

    setState(() {
      resultado = "Capital inicial: \$${capital.toStringAsFixed(2)}\n"
          "Interés generado: \$${interes.toStringAsFixed(2)}\n"
          "Monto final: \$${montoFinal.toStringAsFixed(2)}";
    });
  }

  void limpiarCampos() {
    capitalController.clear();
    tasaController.clear();
    tiempoController.clear();
    setState(() {
      resultado = "";
    });
  }

  void mostrarAlerta(String mensaje) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Error"),
        content: Text(mensaje),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cerrar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Calculadora de Interés Simple",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: capitalController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: "Capital inicial",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: tasaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: "Tasa de interés anual (%)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: tiempoController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: "Tiempo (años)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: calcularInteres,
                  icon: const Icon(Icons.calculate),
                  label: const Text("Calcular"),
                ),
                ElevatedButton.icon(
                  onPressed: limpiarCampos,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Limpiar"),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 240, 192, 189)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (resultado.isNotEmpty)
              Text(
                resultado,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
