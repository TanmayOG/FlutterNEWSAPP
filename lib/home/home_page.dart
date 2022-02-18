// ignore_for_file: avoid_unnecessary_containers, file_names


import 'package:flutter/material.dart';


import 'package:newmo/pages/entertainment.dart';
import 'package:newmo/pages/home.dart';
import 'package:newmo/pages/sports.dart';
import 'package:newmo/pages/topheadline.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController onPageController = PageController();



  void changePage(int index) {
    setState(() {
      onPageController.jumpToPage(index);
      currentIndex = index;
    });
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final items = [
      SalomonBottomBarItem(
        icon: const Icon(Icons.home),
        title: const Text("TopHeadline"),
        selectedColor: Colors.purple,
      ),

      /// Likes
      SalomonBottomBarItem(
        icon: const Icon(Icons.computer_sharp),
        title: const Text("Tech"),
        selectedColor: Colors.pink,
      ),

      /// Search
      SalomonBottomBarItem(
        icon: const Icon(Icons.live_tv),
        title: const Text("Entertainment"),
        selectedColor: Colors.orange,
      ),

      /// Profile
      SalomonBottomBarItem(
        icon: const Icon(Icons.sports_cricket_sharp),
        title: const Text("Sports"),
        selectedColor: Colors.teal,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,

      
      body: PageView(
        children: [
          Container(
            // ignore: prefer_const_constructors
            child: TopHeadLines(),
          ),
          Container(
            // ignore: prefer_const_constructors
            child: Home(),
          ),
          Container(
            // ignore: prefer_const_constructors
            child: Entertianment(),
          ),
          Container(
            // ignore: prefer_const_constructors
            child: SportsNews(),
          ),
        ],
        controller: onPageController,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentIndex, onTap: changePage, items: items),
    );
  }
}
