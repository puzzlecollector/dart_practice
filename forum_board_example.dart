import 'package:flutter/material.dart';

void main() {
  runApp(ForumApp());
}

class ForumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ForumBoardScreen(),
    );
  }
}

class ForumBoardScreen extends StatelessWidget {
  final List<Map<String, String>> forumPosts = [
    {
      "title": "Welcome to the Forum!",
      "description": "Introduce yourself and get to know others here.",
    },
    {
      "title": "Flutter Tips & Tricks",
      "description": "Share your best practices and tips for Flutter development.",
    },
    {
      "title": "General Discussion",
      "description": "Talk about anything and everything here!",
    },
    {
      "title": "Project Showcase",
      "description": "Show off your amazing projects to the community.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum Board"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: forumPosts.length,
          itemBuilder: (context, index) {
            final post = forumPosts[index];
            return ForumPostCard(
              title: post["title"]!,
              description: post["description"]!,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for adding a new post
        },
        child: Icon(Icons.add),
        tooltip: "Add New Post",
      ),
    );
  }
}

class ForumPostCard extends StatelessWidget {
  final String title;
  final String description;

  ForumPostCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Text(title[0]),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
