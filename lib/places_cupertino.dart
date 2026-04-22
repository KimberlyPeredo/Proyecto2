import 'package:flutter/material.dart';
import 'package:places/home.dart';
import 'package:places/profile_places.dart';
import 'package:places/search_places.dart';

class PlacesCupertino extends StatefulWidget {
  final String username;

  const PlacesCupertino({super.key, required this.username});

  @override
  State<PlacesCupertino> createState() => _PlacesCupertinoState();
}

class _PlacesCupertinoState extends State<PlacesCupertino> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      MyHome(),
      SearchPlaces(),
      ProfilePlaces(username: widget.username),
    ];

    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFF574ACF),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}