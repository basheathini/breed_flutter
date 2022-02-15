import 'package:delta_flutter_assessment/models/all_breeds.dart';
import 'package:delta_flutter_assessment/utils/api_helper.dart';

class AllBreedRepository {
  final ApiHelper _apiHelper = ApiHelper();
  
  Future<List<String>> fetchAllBreeds() async {
    final response = await _apiHelper.get('breeds/list/all');
    return AllBreedsModel.fromJson(response).names;
  }
}