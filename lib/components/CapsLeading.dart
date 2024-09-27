import 'package:flutter/material.dart';

class CapsLeading extends StatelessWidget {
  const CapsLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { 
        Scaffold.of(context).openDrawer();
      },
      child: const Padding(
        padding: const EdgeInsets.all(5.0),
        child: const ClipOval(
          child: Image(
          image: NetworkImage('https://static.wikia.nocookie.net/silly-cat/images/2/2f/Bingus.png'),
          ),
        ),
      ),
    );
  }
}
