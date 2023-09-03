import 'package:fit_now/home_item/view/home_page.dart';
import 'package:fit_now/record_item/view/record_page.dart';
import 'package:flutter/material.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 4, 35, 61),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: screenHeight * 0.02),
          child: Container(
            width: screenWidth * 0.8,
            height: kBottomNavigationBarHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 12, 53, 86)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home,
                      color: _currentIndex == 0 ? Colors.blue : Colors.grey),
                  onPressed: () => _onTabTapped(0),
                ),
                IconButton(
                  icon: Icon(Icons.bar_chart,
                      color: _currentIndex == 1 ? Colors.blue : Colors.grey),
                  onPressed: () => _onTabTapped(1),
                ),
                IconButton(
                  icon: Icon(Icons.health_and_safety_rounded,
                      color: _currentIndex == 2 ? Colors.blue : Colors.grey),
                  onPressed: () => _onTabTapped(2),
                ),
                IconButton(
                  icon: Icon(Icons.person,
                      color: _currentIndex == 3 ? Colors.blue : Colors.grey),
                  onPressed: () => _onTabTapped(3),
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const[
            HomePage(),
          //  Scaffold(backgroundColor: Colors.amber,),
          RecordPage(),
            Scaffold(
              backgroundColor: Colors.cyan,
            ),
            Scaffold(
              backgroundColor: Colors.green,
            )
          ],
        ));
  }
}
