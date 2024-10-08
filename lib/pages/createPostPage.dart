import 'package:flutter/material.dart';
import 'package:caps/components/CapsBottomNavigationBar.dart';
import 'package:caps/components/CapsLeading.dart';
import 'package:caps/components/CapsDrawer.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const CapsLeading(),
        title: const Text('Tela de Post', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              // Ação para o botão "Cancelar"
            },
            child: const Text('Cancelar', style: TextStyle(color: Colors.purple)),
          ),
          TextButton(
            onPressed: () {
              // Ação para o botão "Postar test"
            },
            child: const Text('Postar', style: TextStyle(color: Colors.purple)),
          ),
        ],
      ),
      drawer: const CapsDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person, color: Colors.white), // Ícone de pessoa genérico para o avatar
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'O que está acontecendo?',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.image, color: Colors.purple),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.gif_box, color: Colors.purple),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.poll, color: Colors.purple),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.location_on, color: Colors.purple),
                    ),
                  ],
                ),
                FloatingActionButton(
                  onPressed: () {
                    // Ação para adicionar outro post ou anexo
                  },
                  backgroundColor: Colors.purple,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // Espaçamento entre os ícones e o rodapé
        ],
      ),
      bottomNavigationBar: const CapsBottomNavigationBar(currentIndex: 2),
    );
  }
}
