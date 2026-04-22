import 'package:flutter/material.dart';
import 'package:places/home.dart';
import 'package:places/profile_places.dart';
import 'package:places/search_places.dart';

class Places extends StatefulWidget {
  final String username;
  Places({required this.username});
  @override
  State<StatefulWidget> createState() {
    return _Places();
  }
}

class _Places extends State<Places> {

  int currentIndex = 0;

  late List<Widget> pantallas;

  @override
  void initState() {
    super.initState();

    pantallas = [
      MyHome(),
      SearchPlaces(),
      ProfilePlaces(username: widget.username), // 🔥 AQUÍ
    ];
  }

  void cambiarPantalla(int index) {
    //setState() actualiza nuestro widget
    setState(() {
      currentIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Color(0xFF574ACF)
          ),
          child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Color(0xFF574ACF),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      color: Color(0xFF574ACF),
                    ),
                    label: "",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xFF574ACF),
                    ),
                    label: "",
                ),
              ],
            onTap:cambiarPantalla ,
          ),
      ),
      body: pantallas[currentIndex],
    );

    return scaffold;
  }

}