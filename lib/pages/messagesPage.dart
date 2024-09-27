import 'package:flutter/material.dart';
import 'package:caps/components/CapsBottomNavigationBar.dart';
import 'package:caps/components/CapsLeading.dart';
import 'package:caps/components/CapsDrawer.dart';


class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages Page'),
        leading: const CapsLeading()
      ),
      drawer: const CapsDrawer(),
      body: const Center(
        child: Text("Messages Page")
      ),
      bottomNavigationBar: const CapsBottomNavigationBar(currentIndex: 3),
    );
  }
}