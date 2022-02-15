import 'package:delta_flutter_assessment/models/breed.dart';
import 'package:delta_flutter_assessment/widgets/app_bar_text.dart';
import 'package:delta_flutter_assessment/widgets/circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:thumbnailer/thumbnailer.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:delta_flutter_assessment/translations/app_translation.dart';

class DogDetails extends StatelessWidget {
  static const routeName = '/dogDetails';
  const DogDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    var breeds = context.watch<Breed?>();


    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: AppBarText('${breeds?.selectedBreed}'),
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



      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              bottom: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: <Widget>[
                    CachedNetworkImage(
                      fit: BoxFit.fill  ,
                      height: deviceSize.height,
                      width: deviceSize.width,
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
                      imageUrl: breeds?.selectedBreedImage ?? '',
                    ),

                    Positioned.fill(
                      bottom: 10,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.black54,
                            ),
                            height: 75,
                            width: deviceSize.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Circle(onClick: () async {
                                  await ImageDownloader.downloadImage(breeds?.selectedBreedImage ?? '');
                                }, icon: Icons.save_alt, color: Colors.purple),
                                const SizedBox(width: 50),
                                Circle(onClick: () async {
                                  await FlutterShare.share(
                                      title: '${breeds?.selectedBreed}',
                                      text: Strings.share.tr,
                                      linkUrl: breeds?.selectedBreedImage ?? '',
                                  );
                                }, icon: Icons.share, color: Colors.green)
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
