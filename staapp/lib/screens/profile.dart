import 'package:flutter/material.dart';
import 'package:staapp/widgets/home/announcements.dart';
import 'package:staapp/widgets/extras/header.dart';
import 'package:staapp/widgets/menu/specials.dart';
import 'package:staapp/widgets/menu/menu.dart';
import 'package:staapp/theme/theme.dart';
import 'package:staapp/theme/styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 4;
  String _profileImage = 'assets/logos/hasini.png'; // Default profile image

  // Sample list of profile picture options
  final List<String> _profileOptions = [
    'assets/logos/hasini.png',
    'assets/logos/unicorn.png',
    'assets/logos/dog.png',
    'assets/logos/dice-1.png',
    'assets/logos/dice-2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildCurvedHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Hasini Vijay Inbasri',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 177, 14, 14),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  _buildInfoCard('Student ID', 'Hv1173559'),
                  _buildInfoCard('Email', 'hasini.vijayinbasri26@ycdsbk12.ca'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurvedHeader() {
    return Container(
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Curved Background
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF8B0000),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(255, 238, 234, 22),
                  width: 6,
                ),
              ),
            ),
            height: 250, // adjust as needed
          ),
          // Profile Picture
          Positioned(
            top: 30,
            child: _buildProfilePicture(),
          ),
          // Title Text
          Positioned(
            bottom: 40,
            child: SafeArea(
              child: Text(
                'Titan Profile',
                style: TextStyle(
                  color: const Color.fromARGB(255, 223, 188, 10),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePicture() {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(199, 255, 255, 21).withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Color.fromARGB(255, 200, 203, 8),
          child: CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage(_profileImage),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
        side: const BorderSide(
            color: Color.fromARGB(255, 144, 8, 8), width: 6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            const Icon(
              Icons.star,
              color: Color.fromARGB(255, 171, 9, 9),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B0000),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  content,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}


