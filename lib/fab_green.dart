import 'package:flutter/material.dart';

class FabGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _FabGreen();
  }
}

class _FabGreen extends State<FabGreen> {
  var _fabIcon = Icons.favorite_border;
  var _fabIconColor= Colors.white;
  void onPressedFav(){
    //setState() actualiza el estado del widget
    setState(() {
      if(_fabIcon == Icons.favorite_border){
        _fabIcon = Icons.favorite;
        _fabIconColor = Colors.white;
      }else{
        _fabIcon = Icons.favorite_border;
        _fabIconColor = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final fabGreen = FloatingActionButton(
      backgroundColor: Color(0xFF016DB58),
      mini: true,
      tooltip: "Fab",
      child: Icon(
        _fabIcon,
        color: _fabIconColor,
      ),
      onPressed: onPressedFav,
    );
    return fabGreen;
  }

}