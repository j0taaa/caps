import 'package:flutter/material.dart';
import 'package:caps/components/Post.dart';
import 'package:caps/classes/Post.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Post post = Post(content: "Hello, world!", username: "John Doe", userHandle: "johndoe", profilePicture: "https://picsum.photos/200/300", likes: 0, images: [], comments: [
      Post(
        content: "Hello, world!", 
        username: "John Doe", 
        userHandle: "johndoe", 
        profilePicture: "https://picsum.photos/200/300", 
        likes: 0, 
        images: [], 
        comments: [],
      ),
      Post(
        content: "Hello, world!", 
        username: "John Doe", 
        userHandle: "johndoe", 
        profilePicture: "https://picsum.photos/200/300", 
        likes: 0, 
        images: [], 
        comments: [],
      ),
      Post(
        content: "Hello, world!", 
        username: "John Doe", 
        userHandle: "johndoe", 
        profilePicture: "https://picsum.photos/200/300", 
        likes: 0, 
        images: [], 
        comments: [],
      ),
      Post(
        content: "Hello, world!", 
        username: "John Doe", 
        userHandle: "johndoe", 
        profilePicture: "https://picsum.photos/200/300", 
        likes: 0, 
        images: [], 
        comments: [],
      ),
      Post(
        content: "Hello, world!", 
        username: "John Doe", 
        userHandle: "johndoe", 
        profilePicture: "https://picsum.photos/200/300", 
        likes: 0, 
        images: [], 
        comments: [],
      ),
    ]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: Column(
        children: [
          // Display the main post at the top
          PostComponent(
            post: post,
            onLike: () {
              print("Liked post by ${post.userHandle}");
            },
          ),
          // "Comments:" text
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: Row(
              children: const [
                Text(
                  'Comentários:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          // Display comments below
          Expanded(
            child: ListView(
              children: post.comments.map((comment) {
                return PostComponent(
                  post: comment,
                  onLike: () {
                    print("Liked comment by ${comment.userHandle}");
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
