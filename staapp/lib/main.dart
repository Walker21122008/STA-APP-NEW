import 'package:flutter/material.dart';
import 'package:staapp/screens/home_page.dart';
import 'package:staapp/screens/menu_page.dart';
import 'package:staapp/screens/song_request.dart';
import 'package:staapp/screens/profile.dart';
import 'package:staapp/screens/settings.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/theme/styles.dart';

// Entry point
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'St. Augustine CHS App',
      theme: lightThemePhone,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

//login stuff

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 238, 220),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MainNavigation(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0), // Reduced top padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logos/sta_logo.png',
                width: 160,
                height: 160,
              ),
              const SizedBox(height: 16), // Reduced spacing
              const Text(
                'St. Augustine CHS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 86, 15, 10),
                  fontSize: 22, // Slightly reduced font size
                ),
              ),
              const SizedBox(height: 24), // Reduced spacing
              SizedBox(
                  width: 200, // Adjusted button width
                  height: 45,  // Adjusted button height
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25), // Slightly adjusted corner radius
                      ),
                      elevation: 3,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const MainNavigation(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logos/Google.png',
                          width: 22, // Adjusted logo size
                          height: 22,
                        ),
                        const SizedBox(width: 3), // Space between logo and text
                        const Text(
                          'Sign in with Google',
                          style: TextStyle(
                            color: Color.fromARGB(255, 75, 19, 19),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}


//up till here

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
    // Choose theme based on screen width
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
