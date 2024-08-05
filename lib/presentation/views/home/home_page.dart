// presentation/views/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:internshala_app/presentation/views/tabs/home_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeTab(),
    const Center(
      child: Text("Tab1"),
    ),
    const Center(
      child: Text("Tab2"),
    ),
    const Center(
      child: Text("Tab3"),
    ),
    const Center(
      child: Text("Tab4"),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: AnimationLimiter(
        child: AnimationConfiguration.synchronized(
          duration: Duration(milliseconds: 500),
          child: SlideAnimation(
            verticalOffset: 10,
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.rocket_launch_outlined),
                  label: 'Internships',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Jobs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label: 'Clubs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'Courses',
                ),
              ],
              currentIndex: _selectedIndex,
              unselectedItemColor: const Color.fromARGB(255, 109, 109, 109),
              fixedColor: const Color.fromARGB(255, 23, 155, 237),
              unselectedLabelStyle:
                  const TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
