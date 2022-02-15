import 'package:cached_network_image/cached_network_image.dart';
import 'package:delta_flutter_assessment/models/breed.dart';
import 'package:delta_flutter_assessment/translations/app_translation.dart';
import 'package:delta_flutter_assessment/views/dog_details.dart';
import 'package:delta_flutter_assessment/widgets/app_bar_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thumbnailer/thumbnailer.dart';
import 'package:get/get.dart';

class BreedCategory extends StatefulWidget {
  static const routeName = '/breed';
  const BreedCategory({Key? key}) : super(key: key);

  @override
  _BreedCategoryState createState() => _BreedCategoryState();
}

class _BreedCategoryState extends State<BreedCategory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var breeds = context.watch<Breed?>();
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AppBarText(Strings.browseBy.trParams({ 'name': breeds?.selectedBreed ?? '' })),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
          elevation: 0.3,
          backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(15.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_outlined, size: 17,),
              ),
            ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      body:  ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10, left: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: GestureDetector(
                onTap: () {
                  Provider.of<Breed>(context, listen: false).getSelectedImage(breeds?.breeds.elementAt(index)).then((value) => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DogDetails()))
                  });
                },
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: 260,
                  progressIndicatorBuilder: (context, url, progress) => Thumbnail(
                    dataResolver: () async {
                      return (await DefaultAssetBundle.of(context)
                          .load('assets/images/placeholder.jpeg'))
                          .buffer
                          .asUint8List();
                    },
                    mimeType: 'image/jpeg',
                    widgetSize: 600,

                  ),
                  imageUrl: breeds?.breeds.elementAt(index),
                ),
            ),
          ),
          );
        },
        itemCount: breeds?.breeds.length,
      )
    );
  }
}