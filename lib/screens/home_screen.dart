import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Temporaray Post Data List
  final List<Map<String, dynamic>> posts = [
    {
      'profileImage': 'assets/images/profile_user1.png',
      'username': 'user1',
      'postImage': 'assets/images/post_ex_01.png',
      'likes': 120,
      'comments': 35,
      'description': 'Beautiful sunset at the beach',
      'date': '1 day ago'
    },
    {
      'profileImage': 'assets/images/profile_user2.png',
      'username': 'user2',
      'postImage': 'assets/images/post_ex_02.png',
      'likes': 95,
      'comments': 22,
      'description': 'A cozy coffee shop in the city',
      'date': '2 days ago'
    },
    {
      'profileImage': 'assets/images/profile_user3.png',
      'username': 'user3',
      'postImage': 'assets/images/post_ex_03.png',
      'likes': 250,
      'comments': 50,
      'description': 'Hiking in the mountains',
      'date': '3 days ago'
    },
    {
      'profileImage': 'assets/images/profile_user4.png',
      'username': 'user4',
      'postImage': 'assets/images/post_ex_04.png',
      'likes': 180,
      'comments': 40,
      'description': 'Delicious homemade pasta',
      'date': '5 days ago'
    }
  ];

  // build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildPostHeader(posts[index]),
                  buildPostImage(posts[index]['postImage']),
                  buildPostFooter(posts[index]),
                  buildPostDescription(posts[index]),
                  buildPostDate(posts[index]['date']),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /////////////////////////////////////
  //////// functions for build ////////
  /////////////////////////////////////
  Widget buildPostHeader(Map<String, dynamic> post) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(post['profileImage'])),
      title: Text(post['username']),
      trailing: TextButton(
        onPressed: () {},
        child: const Text('Follow', style: TextStyle(color: Colors.blue)),
      ),
    );
  }

  Widget buildPostImage(String postImage) {
    return Image.asset(postImage,
        fit: BoxFit.cover, height: 300, width: double.infinity);
  }

  Widget buildPostFooter(Map<String, dynamic> post) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const Icon(Icons.favorite_border),
              const SizedBox(width: 8),
              Text('${post['likes']} likes'),
              const SizedBox(width: 16),
              const Icon(Icons.comment),
              const SizedBox(width: 8),
              Text('${post['comments']} comments')
            ],
          ),
          const Icon(Icons.bookmark_border)
        ]));
  }

  Widget buildPostDescription(Map<String, dynamic> post) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: '${post['username']} ',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            TextSpan(
              text: '${post['description']}',
              style: const TextStyle(color: Colors.black),
            )
          ]),
        ));
  }

  Widget buildPostDate(String date) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Text(date,
            style: const TextStyle(color: Colors.grey, fontSize: 12)));
  }
}
