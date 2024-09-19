import 'package:examen1_lcjr/Clases/Home.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  static String id = "login_page";

  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  final String correctUsername = "test";
  final String correctPassword = "FDM1";
  
  get borderRadius => null;

  void _validateInputs() {
    setState(() {
      String user = _userController.text;
      String password = _passwordController.text;

      if (user.isEmpty || password.isEmpty) {
        _errorMessage = "Datos incompletos";
      } else if (user != correctUsername && password != correctPassword) {
        _errorMessage = "Usuario y contraseña incorrectos";
      } else if (user != correctUsername) {
        _errorMessage = "Usuario incorrecto";
      } else if (password != correctPassword) {
        _errorMessage = "Contraseña incorrecta";
      } else {
        _errorMessage = '';
        Navigator.push(
          context,
         MaterialPageRoute(
          builder: (context) => HomePage(studentName: 'Lujan_Carrera_Jose_Rodolfo'),
          ) ,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildColoredContainer(Colors.teal, 150),
                      _buildColoredContainer(Colors.teal[800]!, 200),
                      _buildColoredContainer(Colors.cyan[700]!, 150),
                      _buildColoredContainer(Colors.teal[800]!, 200),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildColoredContainer(Colors.teal, 150),
                      _buildColoredContainer(Colors.teal[800]!, 200),
                      _buildColoredContainer(Colors.cyan[700]!, 150),
                      _buildColoredContainer(Colors.teal[800]!, 200),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildColoredContainer(Colors.teal, 150),
                      _buildColoredContainer(Colors.teal[800]!, 200),
                      _buildColoredContainer(Colors.cyan[700]!, 150),
                      _buildColoredContainer(Colors.teal[800]!, 200),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 600,
                height: 400, // Ajustamos el tamaño para dar espacio al error
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bienvenido a tu primer EXAMEN',
                        style: TextStyle(
                          color: Colors.amber[800],
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Mostrar mensaje de error si lo hay
                      if (_errorMessage.isNotEmpty)
                        Text(
                          _errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _userController,
                        decoration: const InputDecoration(
                          labelText: 'Correo/Usuario',
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: _validateInputs,
                        child: const Text('Iniciar Sesión'),
                        
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColoredContainer(Color color, double width) {
    return Expanded(
      child: Container(
        width: width,
        color: color,
      ),
    );
  }
}
