import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// Halaman Home
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewsApp'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Swipe News
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Swipe News',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 538,
            height: 511,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                NewsCard(
                  image: 'assets/images/Image_News_1.png',
                  title:
                      'Microsoft launches a \n deepfake detector tool \n ahead of US election',
                  category: 'TECHNOLOGY',
                ),
                NewsCard(
                  image: 'assets/images/Image_News_1.png',
                  title: 'Startup raises \$54 million',
                  category: 'TECHNOLOGY',
                ),
              ],
            ),
          ),
          // Latest News
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Latest News',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  LatestNewsTile(
                    image: 'assets/images/Image_News_6.png',
                    title:
                        'Insurtech startup\n PasarPolis gets \$54 \n million — Series B',
                  ),
                  LatestNewsTile(
                    image: 'assets/images/Image_News_3.png',
                    title:
                        'The IPO parade \n continues as Wish \n files, Bumble ',
                  ),
                  LatestNewsTile(
                    image: 'assets/images/Image_News_5.png',
                    title:
                        'Hypatos gets\n \$11.8M for deep\n learning automation',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Kartu untuk Swipe News
class NewsCard extends StatelessWidget {
  final String image;
  final String title;
  final String category;

  NewsCard({
    required this.image,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Row(
                children: [
                  Icon(Icons.bookmark_border, color: Colors.white),
                  SizedBox(width: 10),
                  Icon(Icons.share, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Tile untuk Latest News
class LatestNewsTile extends StatelessWidget {
  final String image;
  final String title;

  LatestNewsTile({
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image),
      title: Text(title),
      subtitle: Text('TECHNOLOGY'),
    );
  }
}

// Halaman Detail News
class NewsDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/Bg_image.png'),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Image_News_7.png'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Samuel Newton',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'TECHNOLOGY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'To build responsibly, tech needs to do more than just hire chief ethics officers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '17 June, 2023 — 4:49 PM',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'In the last couple of years, we’ve seen new teams in tech companies emerge that focus on responsible innovation...',
                    style: TextStyle(fontSize: 16, height: 1.5),
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
