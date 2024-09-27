import 'package:flutter/material.dart';
import 'package:caps/components/CapsBottomNavigationBar.dart';
import 'package:caps/components/CapsLeading.dart';
import 'package:caps/components/CapsDrawer.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        leading: const CapsLeading()
      ),
      drawer: const CapsDrawer(),
      body: const Center(
        child: Text("Main Page")
      ),
      bottomNavigationBar: const CapsBottomNavigationBar(currentIndex: 0),
    );
  }
}