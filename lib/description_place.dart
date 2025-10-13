import 'package:flutter/material.dart';

class DescriptionPlace extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final titulo= Container(
      margin: EdgeInsets.only(
        right: 20
      ),
      child: Text(
          "Duwili Ella",
           style: TextStyle(
             fontSize: 38,
             fontWeight: FontWeight.bold
      ),
      ),
    );

    final estrella= Container(
      margin: EdgeInsets.only(
        right: 5
      ),
      child: Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );

    final estrellaBorde= Container(
      margin: EdgeInsets.only(
        right: 5
      ),
      child: Icon(
        Icons.star_border,
        color: Colors.black54,
      ),
    );

    final filaEstrellas= Row(
      children: <Widget>[
        estrella,
        estrella,
        estrella,
        estrella,
        estrellaBorde
      ],
    );

    final filaTitulo = Row(
      children: <Widget> [
        titulo,
        filaEstrellas
      ],
    );

    final descripcion = Container(
      margin: EdgeInsets.only(
        top: 10
      ),
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        style: TextStyle(
          color: Colors.black54
        ) ,
      ),
    );
    final descriptionPlace = Column(
      children: <Widget>[
        filaTitulo,
        descripcion

      ],
    );

    return descriptionPlace;
  }
}