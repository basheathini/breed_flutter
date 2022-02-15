import 'package:delta_flutter_assessment/repositories/all_breed_repository.dart';
import 'package:delta_flutter_assessment/translations/app_translation.dart';
import 'package:delta_flutter_assessment/widgets/app_bar_text.dart';
import 'package:delta_flutter_assessment/widgets/breed_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBreeds extends StatefulWidget {
  static const routeName = '/allBreeds';
  const AllBreeds({Key? key}) : super(key: key);
  @override
  _AllBreedsState createState() => _AllBreedsState();
}

class _AllBreedsState extends State<AllBreeds> {

  late Future<List<String>> category;
  final AllBreedRepository _allBreedRepository = AllBreedRepository();


  @override
  void initState() {
    super.initState();
    category = _allBreedRepository.fetchAllBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AppBarText(Strings.browse.tr),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
          elevation: 0.3,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 15, right: 5),
                child: FutureBuilder<List<String>>(
                  future: category,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return  GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 8.0,
                        children: List.generate(
                            snapshot.data?.length ?? 1, (index) {
                              return BreedCard(snapshot.data?.elementAt(index) ?? '');
                        })
                      );
                    }else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.black, strokeWidth: 3.5),
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}