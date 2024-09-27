import 'package:flutter/material.dart';
import 'package:caps/components/CapsBottomNavigationBar.dart';
import 'package:caps/components/CapsLeading.dart';
import 'package:caps/components/CapsDrawer.dart';
import 'package:caps/components/Post.dart';
import 'package:caps/classes/Post.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        leading: const CapsLeading(),
      ),
      drawer: const CapsDrawer(),
      body: Column(
        children: [
          PostComponent(post: Post(content: "Hello, world!", author: "John Doe", profilePicture: "https://picsum.photos/200/300", likes: 0)),
          PostComponent(post: Post(content: "Hello, world!", author: "John Doe", profilePicture: "https://picsum.photos/200/300", likes: 0)),
          PostComponent(post: Post(content: "Hello, world!", author: "John Doe", profilePicture: "https://picsum.photos/200/300", likes: 0)),
        ],
      ),
      bottomNavigationBar: const CapsBottomNavigationBar(currentIndex: 0),
    );
  }
}