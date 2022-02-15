import 'package:delta_flutter_assessment/models/all_breeds.dart';
import 'package:delta_flutter_assessment/models/breed.dart';
import 'package:delta_flutter_assessment/utils/api_helper.dart';

class BreedRepository {
  final ApiHelper _apiHelper = ApiHelper();
  Future<List<dynamic>> fetchAllBreed(String breed) async {
    final response = await _apiHelper.get('breed/$breed/images');
    return BreedModel.fromJson(response).images;
  }
}