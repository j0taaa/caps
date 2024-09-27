import 'package:flutter/material.dart';
import 'package:caps/components/CapsBottomNavigationBar.dart';
import 'package:caps/components/CapsLeading.dart';
import 'package:caps/components/CapsDrawer.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisa'),
        leading: const CapsLeading()
      ),
      drawer: const CapsDrawer(),
      body: const Center(
        child: Text("Pesquisa")
      ),
      bottomNavigationBar: const CapsBottomNavigationBar(currentIndex: 1),
    );
  }
}