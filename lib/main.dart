import 'package:delta_flutter_assessment/models/all_breeds.dart';
import 'package:delta_flutter_assessment/models/breed.dart';
import 'package:delta_flutter_assessment/views/all_breeds.dart';
import 'package:delta_flutter_assessment/views/breed_category.dart';
import 'package:delta_flutter_assessment/views/dog_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => Breeds()),
        ChangeNotifierProvider(
            create: (BuildContext context) => Breeds()
        ),
        ChangeNotifierProvider(
            create: (BuildContext context) => Breed()
        ),
      ],

      child: MaterialApp(
          title: 'Dogs',
          theme: ThemeData(
            primarySwatch: Colors.red,
            fontFamily: 'OpenSans',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          home: const AllBreeds(),
          routes: {
            AllBreeds.routeName: (context) => const AllBreeds(),
            BreedCategory.routeName: (context) => const BreedCategory(),
            DogDetails.routeName: (context) => const DogDetails()
          },
        ),
    );
  }
}