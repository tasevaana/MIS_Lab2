import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/joke_model.dart';

class RandomJokeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Joke',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          backgroundColor: Colors.pink,
          iconTheme: IconThemeData(
          color: Colors.white, // Back button color
        ),

          ),
      body: FutureBuilder<Joke>(
        future: ApiService.getRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final joke = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(joke.setup, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(joke.punchline, style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
