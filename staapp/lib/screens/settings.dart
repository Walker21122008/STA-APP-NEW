import 'package:flutter/material.dart';
import 'package:staapp/widgets/home/announcements.dart';
import 'package:staapp/widgets/extras/header.dart';
import 'package:staapp/widgets/menu/specials.dart';
import 'package:staapp/widgets/menu/menu.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/theme/styles.dart';

void main() {
  runApp(const MyApp());
}

const MaterialColor mySwatch = MaterialColor(
  0xFF4E110C,
  <int, Color>{
    50: Color(0xFFF2E3E2),
    100: Color(0xFFE0BEBB),
    200: Color(0xFFCC9691),
    300: Color(0xFFB86E67),
    400: Color(0xFFA74F48),
    500: Color(0xFF4E110C), // your main color
    600: Color(0xFF470F0B),
    700: Color(0xFF3D0D09),
    800: Color(0xFF340B08),
    900: Color(0xFF240704),
  },
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings App',
      theme: ThemeData(
        primarySwatch: mySwatch,
        fontFamily: 'SF Pro Display', // Set the default font
      ),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = false;

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF9FAFB), // Light background
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Header(name: "Settings"),
            const SizedBox(height: 24),
            _buildCard(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Enable General Notifications',
                        style: TextStyle(fontSize: 18),
                      ),
                      Switch(
                        value: _notificationsEnabled,
                        onChanged: (newValue) {
                          setState(() {
                            _notificationsEnabled = newValue;
                          });
                        },
                        activeColor: const Color.fromARGB(255, 182, 182, 9),
                      ),
                    ],
                  ),
                  _buildListTile(
                    title: 'Send Feedback',
                  ),
                  _buildListTile(
                    title: 'Log Out',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildCard(
              child: _buildListTile(
                title: 'FAQ',
                trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 204, 219, 1)),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  // Builds a Card widget with a subtle shadow
  Widget _buildCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 89, 26, 26).withOpacity(0.2), // More subtle shadow
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // Slightly shifted shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }

  // Builds a ListTile with custom styling
  Widget _buildListTile({
    required String title,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12), // Increased vertical padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 18), // Increased font size
            ),
            trailing ?? const SizedBox(), // Use provided trailing widget or an empty SizedBox
          ],
        ),
      ),
    );
  }

  
}

