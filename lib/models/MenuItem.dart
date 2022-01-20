import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final MaterialColor color;
  final String destination;

  MenuItem(this.title, this.icon, this.color, this.destination);


  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){Navigator.of(context).pushNamed(destination);},
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 70.0, color: color,),
              Text(title, style: const TextStyle(
                  fontSize: 17.0
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
