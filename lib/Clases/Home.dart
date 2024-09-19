import 'package:examen1_lcjr/Clases/Constantes.dart';
import 'package:examen1_lcjr/Clases/more_info.dart';
import 'package:flutter/material.dart';  // Importamos el archivo con las constantes

class HomePage extends StatefulWidget {
  final String studentName;

  const HomePage({super.key, required this.studentName});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      backgroundColor: AppColors.fondo,  
      appBar: AppBar(
        automaticallyImplyLeading: false,  
        backgroundColor: AppColors.fondo3,  
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 250, vertical: 5), 
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(10), 
          ),
          child: const Text(
            'Notificaciones de actividades',
            style: TextStyle(
              color: AppColors.titulos,  
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
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
                  bool esPar = actividad['id'] % 2 == 0;

                  return Card(
                    color: Colors.white,  
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5, 
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${actividad['id']}',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.fondo2,
                                      ),
                                    ),
                                    const Spacer(),
                                    if (esPar) const Icon(Icons.eco, color: AppColors.efectos),
                                  ],
                                ),
                                Text(
                                  actividad['title'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,  
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  actividad['note'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black, 
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(
                                      5,
                                      (starIndex) => Icon(
                                        Icons.star,
                                        color: starIndex < actividad['rating']
                                            ? AppColors.efectos  
                                            : Colors.grey,      
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (esPar)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () => _verMas(actividad), 
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.botones, 
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  icon: const Icon(Icons.edit, size: 16),
                                  label: const Text('Ver más'),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton.icon(
                                  onPressed: () => _borrarActividad(actividad['id']),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.botones,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  icon: const Icon(Icons.delete, size: 16),
                                  label: const Text('Borrar'),
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
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.titulos, 
                ),
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
