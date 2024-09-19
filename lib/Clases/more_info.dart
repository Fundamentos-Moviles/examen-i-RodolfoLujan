import 'package:flutter/material.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecuadrosGrid(),
    );
  }
}
class RecuadrosGrid extends StatefulWidget {
  @override
  _RecuadrosGridState createState() => _RecuadrosGridState();
}

class _RecuadrosGridState extends State<RecuadrosGrid> {
  List<List<Widget>> filas = [[]]; // Lista de filas con recuadros

  void _agregarRecuadro() {
    setState(() {
      // Obtiene la última fila
      List<Widget> ultimaFila = filas.last;
      int numeroRecuadros = ultimaFila.length + 1;

      // Si llegamos a 12 recuadros, empezamos una nueva fila
      if (numeroRecuadros > 12) {
        filas.add([_crearRecuadro(1)]); // Nueva fila con 1 recuadro
      } else {
        // Añade un recuadro más a la fila actual
        ultimaFila.add(_crearRecuadro(numeroRecuadros));
      }
    });
  }

  Widget _crearRecuadro(int numeroRecuadros) {
    // Retorna un recuadro con un ancho dividido según el número de recuadros en la fila
    return Expanded(
      flex: 1, 
      child: Container(
        height: 200, // Altura fija para todos los recuadros
        color: numeroRecuadros % 2 == 0 ? Colors.blue : Colors.teal, // Color alternado
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: ElevatedButton(
            onPressed: _agregarRecuadro,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Color del botón
              minimumSize: const Size(600, 50), 
            ),
            child: const Text(
              'Inicio Sesión',
              style: TextStyle(fontSize: 18,), // Texto más grande
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Para cada fila, creamos un Row con los recuadros dentro
          Expanded(
            child: ListView.builder(
              itemCount: filas.length,
              itemBuilder: (context, index) {
                return Row(
                  children: filas[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
