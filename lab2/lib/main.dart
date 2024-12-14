import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/joke_list_screen.dart';
import 'screens/random_joke_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/random-joke': (context) => RandomJokeScreen(),
        '/joke-list': (context) => JokeListScreen(
              type: ModalRoute.of(context)!.settings.arguments as String,
            ),
      },
    );
  }
}
