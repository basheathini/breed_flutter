import 'package:delta_flutter_assessment/repositories/all_breed_repository.dart';
import 'package:flutter/foundation.dart';

class AllBreedsModel {
  List<String> names;
  String status;

  AllBreedsModel ({ required this.names, required this.status});

  factory AllBreedsModel.fromJson(Map<String, dynamic> json) {
    return AllBreedsModel(
      names : json['message'].keys.toList() ?? [],
      status : json['status'] ?? '',
    );
  }
}

class Breeds with ChangeNotifier {
  late List<String> _names = <String>[];
  late AllBreedRepository _allBreedRepository;
  late String _breed;

  Breeds();

  List<String> get breeds {
    return _names;
  }

  String get breed {
    return _breed;
  }

  Future<void>  getAllBreeds() async {
    _allBreedRepository = AllBreedRepository();
    _names = await _allBreedRepository.fetchAllBreeds();
    notifyListeners();
  }

  Future<void> selectedBreed(String breed) async {
    _breed = breed;
    notifyListeners();
  }
}