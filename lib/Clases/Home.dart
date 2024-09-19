import 'package:examen1_lcjr/Clases/more_info.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String studentName;

  HomePage({required this.studentName});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> actividades = [
    {'id': 8, 'title': 'Iniciar el examen', 'note': 'Subir el examen antes de las 9 am del viernes', 'rating': 5},
    {'id': 9, 'title': 'Terminar y enviar mi examen', 'note': 'No quiero reprobar', 'rating': 4},
    {'id': 10, 'title': 'Revisar 36 examenes', 'note': 'Los alumnos tendrán todo lo que se les pidió', 'rating': 3},
    {'id': 11, 'title': 'Revisar tareas', 'note': 'Llenar la lista con las calificaciones', 'rating': 2},
    {'id': 12, 'title': 'Iniciar el examen', 'note': 'Subir el examen antes de las 9 am del viernes', 'rating': 5},
    {'id': 13, 'title': 'Terminar y enviar mi examen', 'note': 'No quiero reprobar', 'rating': 4},
    {'id': 14, 'title': 'Revisar 36 examenes', 'note': 'Los alumnos tendrán todo lo que se les pidió', 'rating': 3},
    {'id': 15, 'title': 'Revisar tareas', 'note': 'Llenar la lista con las calificaciones', 'rating': 2},
    {'id': 16, 'title': 'Iniciar el examen', 'note': 'Subir el examen antes de las 9 am del viernes', 'rating': 5},
    {'id': 17, 'title': 'Terminar y enviar mi examen', 'note': 'No quiero reprobar', 'rating': 4},
    {'id': 18, 'title': 'Revisar 36 examenes', 'note': 'Los alumnos tendrán todo lo que se les pidió', 'rating': 3},
    {'id': 19, 'title': 'Revisar tareas', 'note': 'Llenar la lista con las calificaciones', 'rating': 2},
  ];

  void _verMas(Map<String, dynamic> actividad) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MoreVista(),
      ),
    );
  }

  void _borrarActividad(int id) {
    if ([10, 15, 20, 23].contains(id)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se puede eliminar la actividad con ID $id')),
      );
    } else {
      setState(() {
        actividades.removeWhere((actividad) => actividad['id'] == id);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Actividad con ID $id eliminada')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones de actividades'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: actividades.length,
                itemBuilder: (context, index) {
                  final actividad = actividades[index];
                  bool esPar = actividad['id'] % 2 == 0; // Verificar si el ID es par

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${actividad['id']}',
                                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  actividad['title'],
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  actividad['note'],
                                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: List.generate(
                                    5,
                                    (starIndex) => Icon(
                                      Icons.star,
                                      color: starIndex < actividad['rating'] ? Colors.yellow : Colors.grey,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Solo muestra los botones si es un número par
                          if (esPar)
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () => _verMas(actividad), // Solo navegará si se presiona este botón
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue, // Mismo color para ambos botones
                                  ),
                                  child: const Text('Ver más'),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () => _borrarActividad(actividad['id']),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue, // Mismo color que "Ver más"
                                  ),
                                  child: const Text('Borrar'),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Segunda Vista: ${widget.studentName}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreVista extends StatelessWidget {
  const MoreVista({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MoreInfo(),
    );
  }
}
