class Post {
  final String content;
  final String userHandle;
  final String username;
  final String profilePicture;
  final int likes;
  final List<String> images;
  final List<Post> comments;

  Post({required this.content, required this.userHandle, required this.username, required this.profilePicture, required this.likes, required this.images, required this.comments});
}