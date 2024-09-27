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
    List<Post> posts = [
      Post(content: "Hello, world!", username: "John Doe", userHandle: "johndoe", profilePicture: "https://picsum.photos/200/300", likes: 0),
      Post(content: "Hello, world!", username: "John Doe", userHandle: "johndoe", profilePicture: "https://picsum.photos/200/300", likes: 0),
      Post(content: "Hello, world!", username: "John Doe", userHandle: "johndoe", profilePicture: "https://picsum.photos/200/300", likes: 0),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        leading: const CapsLeading(),
      ),
      drawer: const CapsDrawer(),
      body: ListView(
        children: posts.map((post) {
          return PostComponent(
            post: post,
            onLike: () {
              print("Liked post by ${post.userHandle}");
            },
          );
        }).toList(),
      ),
      bottomNavigationBar: const CapsBottomNavigationBar(currentIndex: 0),
    );
  }
}