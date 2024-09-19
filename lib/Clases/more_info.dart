import 'package:examen1_lcjr/Clases/Constantes.dart';
import 'package:flutter/material.dart';  // Importar los colores de constantes.dart

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
  List<List<Widget>> filas = [[]]; 
  List<Color> colores = [
    AppColors.fondo, 
    AppColors.fondo2, 
    AppColors.fondo3, 
    AppColors.fondo4,
    AppColors.botones, 
    AppColors.efectos  
  ];

  int recuadroContador = 0;  

  void _agregarRecuadro() {
    setState(() {
      // Obtiene la última fila
      List<Widget> ultimaFila = filas.last;
      int numeroRecuadros = ultimaFila.length + 1;

      if (numeroRecuadros > 12) {
        filas.add([_crearRecuadro(1)]); 
      } else {
        ultimaFila.add(_crearRecuadro(numeroRecuadros));
      }
    });
  }

  Widget _crearRecuadro(int numeroRecuadros) {

    Color color = colores[recuadroContador % colores.length];
    recuadroContador++; 

    return Expanded(
      flex: 1, 
      child: Container(
        height: 200, 
        color: color, 
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
              backgroundColor: AppColors.botones, 
              minimumSize: const Size(600, 50), 
            ),
            child: const Text(
              'Inicio Sesión',
              style: TextStyle(fontSize: 18), 
            ),
          ),
        ),
      ),
      body: Column(
        children: [
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
