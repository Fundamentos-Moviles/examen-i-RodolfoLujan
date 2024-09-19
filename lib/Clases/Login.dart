import 'package:examen1_lcjr/Clases/Constantes.dart';
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
            builder: (context) => const HomePage(studentName: 'Lujan_Carrera_Jose_Rodolfo'),
          ),
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
                      _buildColoredContainer(AppColors.fondo2, 150),
                      _buildColoredContainer(AppColors.fondo, 200),
                      _buildColoredContainer(AppColors.fondo3, 150),
                      _buildColoredContainer(AppColors.fondo4, 200),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildColoredContainer(AppColors.fondo4, 150),
                      _buildColoredContainer(AppColors.fondo3, 200),
                      _buildColoredContainer(AppColors.fondo2, 150),
                      _buildColoredContainer(AppColors.fondo, 200),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildColoredContainer(AppColors.fondo3, 150),
                      _buildColoredContainer(AppColors.fondo4, 200),
                      _buildColoredContainer(AppColors.fondo, 150),
                      _buildColoredContainer(AppColors.fondo2, 200),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20), 
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Bienvenido a tu primer EXAMEN',
                      style: TextStyle(
                        color: AppColors.titulos,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _userController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // Fondo blanco
                        labelText: 'Correo/Usuario',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // Fondo blanco
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10), // Aumentamos espacio debajo del error
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(
                      width: double.infinity, // Botón más ancho
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.botones,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: _validateInputs,
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    // Mensaje debajo del botón
                    const SizedBox(height: 20),
                    const Text(
                      'Mi primer examen, ¿estará sencillo?',
                      style: TextStyle(
                        color: AppColors.efectos,
                        fontSize: 16,
                      ),
                    ),
                  ],
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
        color: color,
        height: double.infinity,
      ),
    );
  }
}
