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
        title: const Text('Create Post Page'),
        leading: const CapsLeading()
      ),
      drawer: const CapsDrawer(),
      body: const Center(
        child: Text("Create Post Page")
      ),
      bottomNavigationBar: const CapsBottomNavigationBar(currentIndex: 2),
    );
  }
}