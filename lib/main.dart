import 'package:flutter/material.dart';
import 'package:examen1_lcjr/Clases/Login.dart';

void main() {
  runApp(Examen());
}
class Examen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: Login.id,
      routes: {
        Login.id:(_) => Login(),
      },
    );
  }
}
