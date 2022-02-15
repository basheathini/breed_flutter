import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Circle extends StatelessWidget {

  final GestureTapCallback onClick;
  final IconData icon;
  final Color color;


  const Circle({Key? key, required this.onClick, required this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onClick,
      child: Container(
        width: 45,
        height: 45,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
