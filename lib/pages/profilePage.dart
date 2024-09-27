import 'package:flutter/material.dart';
import 'package:caps/components/CapsBottomNavigationBar.dart';
import 'package:caps/components/CapsLeading.dart';
import 'package:caps/components/CapsDrawer.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        leading: const CapsLeading()
      ),
      drawer: const CapsDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Profile Page"),
          ],
        )
      ),
      bottomNavigationBar: const CapsBottomNavigationBar(currentIndex: 4),
    );
  }
}