import 'package:flutter/material.dart';
import 'package:examen1_lcjr/Clases/Login.dart';

void main() {
  runApp(const Examen());
}
class Examen extends StatelessWidget {
  const Examen({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: Login.id,
      routes: {
        Login.id:(_) => const Login(),
      },
    );
  }
}
