import 'package:delta_flutter_assessment/models/breed.dart';
import 'package:delta_flutter_assessment/views/breed_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class BreedCard extends StatefulWidget {
  final String name;
  const BreedCard(this.name, {Key? key}) : super(key: key);

  @override
  _BreedCardState createState() => _BreedCardState();
}

class _BreedCardState extends State<BreedCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Breed>(context, listen: false).getAllSubBreeds(widget.name).then((value) => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const BreedCategory()))
        });
      },
      child: Card(
        elevation: 2,
        color: Colors.grey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.name.substring(0, 1).toUpperCase() ?? '',
                    style: GoogleFonts.anton(fontSize: 14),
                  ),
                ),
                Text(
                    widget.name.toString(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quando(fontSize: 14)
                )
              ],
            )),
      ),
    );
  }
}
