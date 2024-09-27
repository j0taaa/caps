import 'package:flutter/material.dart';

class CapsDrawer extends StatelessWidget {
  const CapsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Registrar'),
            onTap: () {
              Navigator.pushNamed(context, "/register");
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.pushNamed(context, "/login");
            },
          ),
          ListTile(
            title: const Text('Post de Exemplo'),
            onTap: () {
              Navigator.pushNamed(context, "/post");
            },
          ),
        ],
      ),
    );
  }
}
