import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppBarText extends StatefulWidget {

  final String text;
  const AppBarText(this.text, {Key? key}) : super(key: key);

  @override
  _AppBarTextState createState() => _AppBarTextState();
}

class _AppBarTextState extends State<AppBarText> {
  @override
  Widget build(BuildContext context) {
    return Text( widget.text, style:  GoogleFonts.anton(fontSize: 12, color: Colors.black, letterSpacing: 3));
  }
}
