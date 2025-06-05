import 'package:flutter/material.dart';
import 'package:ejercicios_01/navigation/drawer.dart';

class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simulador de ahorro mensual"),
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
        child: const Center(child: AhorroForm()),
      ),
    );
  }
}

class AhorroForm extends StatefulWidget {
  const AhorroForm({super.key});

  @override
  State<AhorroForm> createState() => _AhorroFormState();
}

class _AhorroFormState extends State<AhorroForm> {
  final ahorroController = TextEditingController();
  final mesesController = TextEditingController();
  final interesController = TextEditingController(); // Opcional

  String resultado = "";
  List<String> desgloseMeses = [];

  void calcularAhorro() {
    final ahorroMensual = double.tryParse(ahorroController.text);
    final meses = int.tryParse(mesesController.text);
    final tasa = double.tryParse(interesController.text);

    if (ahorroMensual == null || meses == null || ahorroMensual <= 0 || meses <= 0) {
      mostrarAlerta("Por favor, ingresa valores numéricos y positivos.");
      return;
    }

    bool usaInteres = tasa != null && tasa > 0;
    double total = 0;
    List<String> detalles = [];

    for (int i = 1; i <= meses; i++) {
      if (usaInteres) {
        total = (total + ahorroMensual) * (1 + tasa / 100);
      } else {
        total += ahorroMensual;
      }
      detalles.add("Mes $i: \$${total.toStringAsFixed(2)}");
    }

    setState(() {
      resultado = "Ahorro total después de $meses meses: \$${total.toStringAsFixed(2)}";
      desgloseMeses = detalles;
    });
  }

  void limpiarCampos() {
    ahorroController.clear();
    mesesController.clear();
    interesController.clear();
    setState(() {
      resultado = "";
      desgloseMeses = [];
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
              "Simulador de Ahorro Mensual",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ahorroController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: "Ahorro mensual",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: mesesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Cantidad de meses",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: interesController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: "Tasa de interés mensual (%) (opcional)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: calcularAhorro,
                  icon: const Icon(Icons.calculate),
                  label: const Text("Calcular"),
                ),
                ElevatedButton.icon(
                  onPressed: limpiarCampos,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Limpiar"),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 250, 221, 219)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (resultado.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(resultado,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ...desgloseMeses
                      .map((linea) => Text(linea,
                          style: const TextStyle(color: Colors.black87)))
                      .toList(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
