import 'package:flutter/material.dart';
import 'package:staapp/screens/home_page.dart';
import 'package:staapp/screens/menu_page.dart';
import 'package:staapp/screens/song_request.dart';
import 'package:staapp/screens/profile.dart';
import 'package:staapp/screens/settings.dart';
import 'package:staapp/theme/styles.dart';
import 'package:staapp/theme/theme.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    ThemeData theme;

    if (width == 1920) {
      theme = lightThemeTV;
    } else if (width < Styles.phoneWidth) {
      theme = lightThemePhone;
    } else {
      theme = lightThemeLaptop;
    }

    final List<Widget> _screens = [
      HomePage(changeTab: _onItemTapped),
      MenuPage(),
      SongPage(),
      ProfilePage(),
      SettingsPage(),
    ];

    return Theme(
      data: theme,
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: 'Songs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          selectedItemColor: Styles.primary,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
