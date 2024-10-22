import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  // Temporaray User Profile data
  final Map<String, dynamic>? profileData;

  ProfileScreen({this.profileData});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Map<String, dynamic> defaultProfileData = {
    'profileImage': 'assets/images/profile_user1.png',
    'username': 'Byeonghwi Park',
    'posts': 4,
    'followers': 120,
    'following': 50,
    'postImages': [
      'assets/images/post_ex_01.png',
      'assets/images/post_ex_02.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
      'assets/images/post_ex_03.png',
    ],
    'taggedImages': ['assets/images/post_ex_04.png']
  };

  late Map<String, dynamic> profileData;
  int _selectedTab = 0; // 0: user's posts, 1: tagged posts

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileData = widget.profileData ?? defaultProfileData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(
              alignment: Alignment.centerLeft,
              child: Text(profileData['username'])), // 왼쪽에 위치
          actions: [
            _buildMenuButton(), // 오른쪽에 위치
          ],
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildProfileInfo(),
          _buildTabBar(),
          const Divider(),
          _buildPostGrid(),
        ])));
  }

  /////////////////////////////////////
  //////// functions for build ////////
  /////////////////////////////////////

  // for profile information
  Widget _buildProfileInfo() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(profileData['profileImage']),
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Column(children: [
            _buildStatsRow(),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton('프로필 편집'),
                _buildActionButton('프로필 공유'),
              ],
            )
          ]))
        ]));
  }

  Widget _buildStatsRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _buildStatColumn(profileData['posts'].toString(), '게시물'),
      _buildStatColumn(profileData['followers'].toString(), '팔로우'),
      _buildStatColumn(profileData['following'].toString(), '팔로잉'),
    ]);
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(count,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label)
      ],
    );
  }

  Widget _buildActionButton(String label) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(label),
        style: ElevatedButton.styleFrom(minimumSize: const Size(100, 27)));
  }

  // for tab bar
  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTabIcon(Icons.grid_on, 0),
        _buildTabIcon(Icons.person_pin, 1)
      ],
    );
  }

  Widget _buildTabIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(icon),
      color: _selectedTab == index ? Colors.blue : Colors.grey,
      onPressed: () {
        setState(() {
          _selectedTab = index;
        });
      },
    );
  }

  Widget _buildMenuButton() {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        addDialog(context);
      },
    );
  }

  // Post Grid
  Widget _buildPostGrid() {
    final images = _selectedTab == 0
        ? profileData['postImages']
        : profileData['taggedImages'];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 축 개수
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Image.asset(images[index], fit: BoxFit.cover);
      },
    );
  }

  /////////////////////////////////////
  /////// Additional Assignment ///////
  /////////////////////////////////////
  void addDialog(context) {
    // use dialog
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              child: ListView(children: [
            _buildMenu(Icons.settings, 'Settings'),
            _buildMenu(Icons.people, 'Manage Followers / Following'),
            _buildMenu(Icons.list, 'My Logs'),
            _buildMenu(Icons.bookmark_border, 'Bookmarks'),
            _buildMenu(Icons.star, 'Favorites'),
          ]));
        });
  }

  Widget _buildMenu(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
          Row(children: [Icon(icon), const SizedBox(width: 12), Text(label)]),
    );
  }
}
