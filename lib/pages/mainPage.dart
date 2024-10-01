import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import the gestures package
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
      Post(content: "Hello, world!", username: "John Doe", userHandle: "johndoe", profilePicture: "https://picsum.photos/200/300", likes: 0, images: ["https://m.media-amazon.com/images/I/B1HVVUyLAhL._CLa%7C2140%2C2000%7C817Q1Zfm1BL.png%7C0%2C0%2C2140%2C2000%2B0.0%2C0.0%2C2140.0%2C2000.0_AC_UY1000_.png"], comments: []),
      Post(content: "Hello, world!", username: "John Doe", userHandle: "johndoe", profilePicture: "https://picsum.photos/200/300", likes: 0, images: [], comments: []),
      Post(content: "Hello, world!", username: "John Doe", userHandle: "johndoe", profilePicture: "https://picsum.photos/200/300", likes: 0, images: [], comments: [
        Post(content: "Hello, world!", username: "John Doe", userHandle: "johndoe", profilePicture: "https://picsum.photos/200/300", likes: 0, images: [], comments: []),
      ]),
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