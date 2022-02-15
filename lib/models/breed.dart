import 'package:delta_flutter_assessment/repositories/all_breed_repository.dart';
import 'package:delta_flutter_assessment/repositories/breed_repository.dart';
import 'package:flutter/foundation.dart';

class BreedModel {
  List<dynamic> images;

  BreedModel({ required this.images});

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    return BreedModel(
      images : json['message'] ?? '',
    );
  }
}

class Breed with ChangeNotifier {
  late List<dynamic> _images = <dynamic>[];
  late BreedRepository _breedRepository;
  late String _breedName;
  late String _image;

  // Breed();

  String get selectedBreed {
    return _breedName;
  }

  String get selectedBreedImage {
    return _image;
  }

  List<dynamic> get breeds {
    return _images;
  }

  Future<void>  getAllSubBreeds(String breed) async {
    _breedRepository = BreedRepository();
    _breedName = breed;
    _images = await _breedRepository.fetchAllBreed(breed);
    notifyListeners();
  }

  Future<void>  getSelectedImage(String image) async {
    _image = image;
    notifyListeners();
  }
}