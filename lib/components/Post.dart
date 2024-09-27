import 'package:flutter/material.dart';
import '../classes/Post.dart';

class PostComponent extends StatefulWidget {
  final Post post;
  final VoidCallback? onLike; // Optional callback function

  const PostComponent({
    super.key,
    required this.post,
    this.onLike,
  });

  @override
  State<PostComponent> createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  bool isLiked = false; // Track like status
  late int likeCount; // Track the number of likes

  @override
  void initState() {
    super.initState();
    // Initialize the like count with the original value from the post
    likeCount = widget.post.likes;
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--; // Decrease likes if already liked
      } else {
        likeCount++; // Increase likes if not liked yet
      }
      isLiked = !isLiked;
    });

    // Call the onLike callback if provided and the post was liked
    if (isLiked && widget.onLike != null) {
      widget.onLike!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              CircleAvatar(
                backgroundImage: NetworkImage(widget.post.profilePicture),
                radius: 24,
              ),
              const SizedBox(width: 10),
              // Post details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Author name and content
                    Row(
                      children: [
                        Text(
                          widget.post.author,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '@${widget.post.author.toLowerCase()}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Post content
                    Text(
                      widget.post.content,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 8),
                    // Likes section
                    Row(
                      children: [
                        GestureDetector(
                          onTap: toggleLike, // Toggle the like status
                          child: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.pink : Colors.grey,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          likeCount.toString(), // Display updated likes
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Divider to separate posts
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
