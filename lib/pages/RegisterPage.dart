import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:caps/components/CapsBottomNavigationBar.dart';
import 'package:caps/components/CapsLeading.dart';
import 'package:caps/components/CapsDrawer.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  String _applyDateMask(String value) {
    value = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (value.length > 2) {
      value = value.substring(0, 2) + '/' + value.substring(2);
    }
    if (value.length > 5) {
      value = value.substring(0, 5) + '/' + value.substring(5);
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    // Obter o tamanho da tela
    final double screenWidth = MediaQuery.of(context).size.width;

    // Se a largura for menor que 1000, usamos layout em uma única coluna
    bool isSmallScreen = screenWidth < 1025;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        leading: const CapsLeading(),
      ),
      drawer: const CapsDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centraliza verticalmente
          children: [
            if (isSmallScreen)
              const Column(
                children: [
                  Text(
                    "Criar Conta",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Estamos animados para você se juntar a nós!",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32)
                ],
              ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centraliza horizontalmente
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centraliza verticalmente
              children: [
                // Texto à esquerda (somente em telas maiores)
                if (!isSmallScreen)
                  const Flexible(
                    // Substitui o Expanded por Flexible
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Criar Conta",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        SizedBox(height: 14),
                        Text(
                          "Estamos animados para você se juntar a nós!",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 440)
                      ],
                    ),
                  ),
                // Formulário centralizado
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      const EmailField(),
                      const SizedBox(height: 16),
                      PasswordField(
                        controller: _passwordController,
                        obscurePassword: _obscurePassword,
                        togglePasswordVisibility: _togglePasswordVisibility,
                      ),
                      const SizedBox(height: 16),
                      DateOfBirthField(
                        controller: _dateController,
                        onTap: () => _selectDate(context),
                        applyDateMask: _applyDateMask,
                      ),
                      const SizedBox(height: 16),
                      const TermsCheckbox(),
                      const SizedBox(height: 16),
                      const SubmitButton(),
                      const SizedBox(height: 16),
                      const BackButtonWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CapsBottomNavigationBar(currentIndex: 4),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscurePassword;
  final VoidCallback togglePasswordVisibility;

  const PasswordField({
    required this.controller,
    required this.obscurePassword,
    required this.togglePasswordVisibility,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscurePassword,
      decoration: InputDecoration(
        labelText: 'Senha',
        prefixIcon: const Icon(Icons.lock),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        suffixIcon: IconButton(
          icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
          onPressed: togglePasswordVisibility,
        ),
      ),
    );
  }
}

class DateOfBirthField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final String Function(String) applyDateMask;

  const DateOfBirthField({
    required this.controller,
    required this.onTap,
    required this.applyDateMask,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.datetime,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
        TextInputFormatter.withFunction((oldValue, newValue) {
          return TextEditingValue(
            text: applyDateMask(newValue.text),
            selection: newValue.selection,
          );
        }),
      ],
      decoration: InputDecoration(
        labelText: 'Data de Nascimento',
        prefixIcon: const Icon(Icons.calendar_today),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_month),
          onPressed: onTap,
        ),
      ),
      onTap: onTap,
    );
  }
}

class TermsCheckbox extends StatefulWidget {
  const TermsCheckbox({super.key});

  @override
  _TermsCheckboxState createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<TermsCheckbox> {
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _agreeToTerms,
          onChanged: (bool? value) {
            setState(() {
              _agreeToTerms = value ?? false;
            });
          },
        ),
        Flexible(
          child: const Text(
            "Concordo com os Termos e Condições",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class SubmitButton extends StatefulWidget {
  const SubmitButton({super.key});

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool _isHovering = false; // Controle de estado para hover

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 140), // Ajuste de padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Arredondamento
          ),
          backgroundColor: _isHovering ? Colors.deepPurple : Colors.deepPurpleAccent, // Cor com hover
        ),
        child: const Text(
          'Próximo',
          style: TextStyle(
            fontSize: 16, 
            color: Colors.white, // Texto branco
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Voltar', style: TextStyle(color: Colors.deepPurpleAccent)),
    );
  }
}
