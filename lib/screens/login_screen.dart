// lib/screens/login_screen.dart

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    // Implementar lógica de autenticação com o backend
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center( // Centraliza horizontalmente
        child: SingleChildScrollView( // Permite rolagem
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
            crossAxisAlignment: CrossAxisAlignment.stretch, // Ocupa toda a largura disponível
            children: [
              // Logo ou imagem opcional
              // Center(
              //   child: Image.asset(
              //     'assets/logo.png',
              //     height: 100,
              //   ),
              // ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                child: Text('Entrar'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Não tem uma conta? Registre-se'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Recovery');
                },
                child: Text('Recuperar senha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
