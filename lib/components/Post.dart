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

  Widget _buildImageGrid() {
    int imageCount = widget.post.images.length;

    double imageSize = 120; // Define a smaller size for the images

    switch (imageCount) {
      case 1:
        return Container(
          height: imageSize,
          width: imageSize,
          child: AspectRatio(
            aspectRatio: 1, // Ensures the image is a square
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.post.images[0],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        );
      case 2:
        return Row(
          children: [
            Expanded(
              child: Container(
                height: imageSize,
                width: imageSize,
                child: AspectRatio(
                  aspectRatio: 1, // Ensures the image is a square
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.post.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: Container(
                height: imageSize,
                width: imageSize,
                child: AspectRatio(
                  aspectRatio: 1, // Ensures the image is a square
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.post.images[1],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      case 3:
        return Row(
          children: [
            Expanded(
              child: Container(
                height: imageSize,
                width: imageSize,
                child: AspectRatio(
                  aspectRatio: 1, // Ensures the image is a square
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.post.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 2),
            Column(
              children: [
                Container(
                  height: imageSize / 2,
                  width: imageSize,
                  child: AspectRatio(
                    aspectRatio: 1, // Ensures the image is a square
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.post.images[1],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  height: imageSize / 2,
                  width: imageSize,
                  child: AspectRatio(
                    aspectRatio: 1, // Ensures the image is a square
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.post.images[2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      case 4:
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: imageSize / 2,
                    width: imageSize / 2,
                    child: AspectRatio(
                      aspectRatio: 1, // Ensures the image is a square
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.post.images[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: Container(
                    height: imageSize / 2,
                    width: imageSize / 2,
                    child: AspectRatio(
                      aspectRatio: 1, // Ensures the image is a square
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.post.images[1],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: imageSize / 2,
                    width: imageSize / 2,
                    child: AspectRatio(
                      aspectRatio: 1, // Ensures the image is a square
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.post.images[2],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: Container(
                    height: imageSize / 2,
                    width: imageSize / 2,
                    child: AspectRatio(
                      aspectRatio: 1, // Ensures the image is a square
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.post.images[3],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      default:
        // Handle more than 4 images if necessary, or fall back to displaying first 4 images
        return SizedBox.shrink();
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
                          widget.post.username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '@${widget.post.userHandle.toLowerCase()}',
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
                    // Images (if any)
                    if (widget.post.images.isNotEmpty) ...[
                      _buildImageGrid(),
                      const SizedBox(height: 8),
                    ],
                    // Likes and comments section
                    Row(
                      children: [
                        // Likes
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
                        const SizedBox(width: 16),
                        // Comments
                        Icon(
                          Icons.comment,
                          color: Colors.grey,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.post.comments.length.toString(),
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
