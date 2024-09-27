import 'package:flutter/material.dart';
import 'pages/mainPage.dart';
import 'pages/searchPage.dart';
import 'pages/createPostPage.dart';
import 'pages/messagesPage.dart';
import 'pages/profilePage.dart';
import 'pages/registerPage.dart';
import 'pages/loginPage.dart';
import 'pages/postPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/search': (context) => const SearchPage(),
        '/create': (context) => const CreatePostPage(),
        '/messages': (context) => const MessagesPage(),
        '/profile': (context) => const ProfilePage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/post': (context) => const PostPage(),
      },
    );
  }
}
