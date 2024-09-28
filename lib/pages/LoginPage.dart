import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import the gestures package
import 'package:caps/components/CapsBottomNavigationBar.dart';
import 'package:caps/components/CapsLeading.dart';
import 'package:caps/components/CapsDrawer.dart';
import 'RegisterPage.dart'; // Importar a página de registro

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false; // Controle de visibilidade da senha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        leading: const CapsLeading(),
      ),
      drawer: const CapsDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20), // Padding lateral para telas menores
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centraliza verticalmente
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centraliza horizontalmente
              children: [
                const Icon(
                  Icons
                      .person, // Ícone temporário, substitua pelo ícone do seu app
                  size: 160,
                  color: Colors.deepPurpleAccent,
                ),
                const SizedBox(height: 20),
                _buildTextField('Email, número ou nome de usuário'),
                const SizedBox(height: 20),
                _buildPasswordField('Senha'),
                const SizedBox(height: 20),
                _buildNextButton(context),
                const SizedBox(height: 20),
                _buildForgotPassword('Esqueceu sua senha?'),
                const SizedBox(height: 20),
                _buildSignUp('Não tem uma conta? ', 'Cadastre-se'),
                const SizedBox(height: 20),                
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CapsBottomNavigationBar(currentIndex: 4),
    );
  }

  Widget _buildForgotPassword(String hintText) {
    return TextButton(
      onPressed: () {
        // Ação para o botão Esqueceu sua senha
      },
      child: Text(hintText, style: const TextStyle(color: Colors.deepPurpleAccent)),
    );
  }

  Widget _buildSignUp(String hintText, String buttonText) {
    return RichText(
      text: TextSpan(
        text: hintText,
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: buttonText,
            style: const TextStyle(color: Colors.deepPurpleAccent),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
          ),
        ],
      ),
    );
  }

  // Função para criar o TextField de email/nome de usuário
  Widget _buildTextField(String hintText) {
    return SizedBox(
      width: 320, // Set the width to 320 pixels
      child: TextField(
        decoration: InputDecoration(
          // hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto, // Move hint text to upper side
          labelText: hintText, // Set the label text
        ),
      ),
    );
  }

  // Função para criar o campo de senha com botão para mostrar/ocultar senha
  Widget _buildPasswordField(String hintText) {
    return SizedBox(
      width: 320, // Set the width to 320 pixels
      child: TextField(
        obscureText: !_isPasswordVisible, // Mostrar/ocultar senha
        decoration: InputDecoration(
          //hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off
              // color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto, // Move hint text to upper side
        labelText: hintText, // Set the label text
        ),
      ),
    );
  }

  // Função para criar o botão de Próximo
  Widget _buildNextButton(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      child: ElevatedButton(
        onPressed: () {
          // Ação do botão Próximo
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 130),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          backgroundColor: _isHovering ? Colors.deepPurple : Colors.deepPurpleAccent, // Cor baseada na imagem
        ),
        child: const Text(
          'Próximo',
          style: TextStyle(fontSize: 16, color: Colors.white), // Texto branco
        ),
      ),
    );
  }

  bool _isHovering = false; // Controle de estado para hover

}
