import 'package:flutter/material.dart';
import 'package:uuu/src/commonWidget/bottomNavigationBar.dart';

import 'VideoNews/videoNewsPage.dart';
import 'category/categoryPage.dart';
import 'homePage/homePage.dart';
import 'profile/profilePage.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(controller: _controller),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          const HomePage(),
          VideoNewsPage(),
          CategoryPage(
            controller: _controller,
          ),
          ProfilePage(),
        ],
      ),
    );
  }
}
