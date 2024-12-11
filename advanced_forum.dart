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
      "title": "혈액 투석 후 피로를 줄이는 방법",
      "description":
          "투석 후 나타나는 피로감을 관리하고 줄이는 방법에 대해 알아보세요. 충분한 휴식과 영양 섭취가 중요합니다.",
    },
    {
      "title": "투석 중 식단 관리 팁",
      "description":
          "투석 환자를 위한 이상적인 식단 구성과 피해야 할 음식을 소개합니다. 건강한 생활을 위한 정보를 확인해 보세요.",
    },
    {
      "title": "혈액 투석 중 흔한 부작용과 대처법",
      "description":
          "혈압 저하, 근육 경련 등 투석 중 나타날 수 있는 부작용에 대해 알고, 이를 관리하는 방법을 배워보세요.",
    },
    {
      "title": "투석 중 심리적 스트레스 관리",
      "description": "투석 과정에서 겪을 수 있는 정서적 어려움을 극복하기 위한 방법과 지원 네트워크를 찾아보세요.",
    },
    {
      "title": "투석 환자를 위한 적절한 운동법",
      "description":
          "투석 환자에게 적합한 운동과 주의사항을 소개합니다. 적절한 운동은 몸과 마음 모두에 긍정적인 영향을 미칩니다.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "정보 공유 게시판",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: Colors.blue,
          ),
        ),
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
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://via.placeholder.com/80',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWithLabel(icon: Icons.remove_red_eye, label: "1.2k"),
                IconWithLabel(icon: Icons.thumb_up_alt_outlined, label: "350"),
                IconWithLabel(icon: Icons.comment_outlined, label: "45"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  IconWithLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey[700],
        ),
        SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    );
  }
}
