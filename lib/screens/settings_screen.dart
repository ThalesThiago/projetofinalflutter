// screens/settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = false; // Variável de exemplo; use um estado para persistir.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('Tema Escuro'),
              value: isDarkTheme,
              onChanged: (bool value) {
                // Lógica para alterar tema
                isDarkTheme = value;
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Notificações'),
              onTap: () {
                // Lógica para configurações de notificações
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                // Lógica para exibir informações sobre o aplicativo
              },
            ),
          ],
        ),
      ),
    );
  }
}
