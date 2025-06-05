import 'package:ejercicios_01/navigation/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora de Propinas para Restaurante")),
      drawer: MiDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fondo2.png"), // Asegúrate de que la ruta esté bien
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Calculadora de Propina",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: datos(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget datos(BuildContext context) {
  final cuentaController = TextEditingController();
  final personalizadaController = TextEditingController();
  final NumberFormat formatoMoneda = NumberFormat.currency(locale: 'es_US', symbol: 'USD');


  double? porcentajeSeleccionado;
  double propina = 0.0;
  double total = 0.0;

  return StatefulBuilder(
    builder: (context, setState) {
      void calcularPropina() {
        final cuenta = double.tryParse(cuentaController.text.replaceAll(',', '.'));
        if (cuenta == null || cuenta <= 0) {
          mostrarAlerta(context, "Error", "Por favor, ingresa un monto válido y positivo.");
          return;
        }

        double porcentaje = porcentajeSeleccionado ?? 0.0;

        if (porcentaje == -1) {
          final personalizada = double.tryParse(personalizadaController.text);
          if (personalizada == null || personalizada < 0) {
            mostrarAlerta(context, "Error", "Ingresa una propina personalizada válida.");
            return;
          }
          porcentaje = personalizada / 100;
        }

        propina = cuenta * porcentaje;
        total = cuenta + propina;

        mostrarAlerta(
          context,
          "Resultado",
          "Propina: ${formatoMoneda.format(propina)}\nTotal a pagar: ${formatoMoneda.format(total)}",
        );
      }

      return Column(
        children: [
          TextField(
            controller: cuentaController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Monto de la cuenta"),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: Text("10%"),
                selected: porcentajeSeleccionado == 0.10,
                onSelected: (_) => setState(() => porcentajeSeleccionado = 0.10),
              ),
              ChoiceChip(
                label: Text("15%"),
                selected: porcentajeSeleccionado == 0.15,
                onSelected: (_) => setState(() => porcentajeSeleccionado = 0.15),
              ),
              ChoiceChip(
                label: Text("20%"),
                selected: porcentajeSeleccionado == 0.20,
                onSelected: (_) => setState(() => porcentajeSeleccionado = 0.20),
              ),
              ChoiceChip(
                label: Text("Personalizado"),
                selected: porcentajeSeleccionado == -1,
                onSelected: (_) => setState(() => porcentajeSeleccionado = -1),
              ),
            ],
          ),
          if (porcentajeSeleccionado == -1)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                controller: personalizadaController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Propina personalizada (%)"),
                ),
              ),
            ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: calcularPropina,
            child: Text("CALCULAR"),
          ),
        ],
      );
    },
  );
}

void mostrarAlerta(BuildContext context, String titulo, String mensaje) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(titulo),
      content: Text(mensaje),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Salir"),
        ),
      ],
    ),
  );
}
