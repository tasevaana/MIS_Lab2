import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke Types',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.pink,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/random-joke');
              },
              icon: Icon(Icons.lightbulb, color: Colors.pink),
              label: Text(
                'Random Joke',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: ApiService.getJokeTypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final jokeTypes = snapshot.data!;
            return ListView.builder(
              itemCount: jokeTypes.length,
              itemBuilder: (context, index) {
                return JokeCard(
                  type: jokeTypes[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/joke-list',
                      arguments: jokeTypes[index],
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
