import 'package:get/get.dart';

// final Map<String, String> _enZA = {
//   'browse': 'Browse By Breed',
//   'imageDownloaded': 'Image successfully downloaded.',
//   'shareHeader': 'I think this dog looks amazing.',
//   'share': 'Successfully shared image.',
//   'browseBy': 'Browse By @name',
// };

abstract class Strings {
  static String get browse => 'Browse By Breed';
  static String get imageDownloaded => 'Image successfully downloaded.';
  static String get shareHeader => 'I think this dog looks amazing.';
  static String get share => 'Successfully shared image.';
  static String get browseBy => 'Browse By @name';
}

// class AppTranslation extends Translations {
//   @override
//   Map<String, Map<String, String>> get keys => {
//     'en_ZA': _enZA,
//   };
// }