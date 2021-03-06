import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/pages/navpages/bar_item_page.dart';
import 'package:flutter_cubit/misc/pages/navpages/home_page.dart';
import 'package:flutter_cubit/misc/pages/navpages/my_page.dart';
import 'package:flutter_cubit/misc/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            title: Text('Bar Item'),
            icon: Icon(Icons.bar_chart_sharp),
          ),
          BottomNavigationBarItem(
            title: Text('Search'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('Me'),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
