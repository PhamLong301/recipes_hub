import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:recipes_hub/model/recipes_response.dart';

import '../model/detail_recipe_reponse.dart';
import '../model/random_recipes.dart';

class SpoonacularApi {
  final Dio _dio = Dio();

  SpoonacularApi() {
    _dio.options.baseUrl = 'https://api.spoonacular.com/';
    _dio.options.queryParameters = {
      'apiKey': 'd2a12b3c5e88427eab0695d845158ad1'
    };
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<RecipesResponse?> fetchRecipes({
    required int currentSize,
    required int skipSize,
  }) async {
    try {
      final response =
          await _dio.get('/recipes/complexSearch', queryParameters: {
        'number': currentSize,
        'offSet': skipSize,
      });
      if (response.statusCode == 200) {
        try {
          return RecipesResponse.fromJson(
              response.data as Map<String, dynamic>);
        } catch (_) {
          return null;
        }
      }
    } catch (e) {
      return null;
    }
  }

  Future<DetailRecipeResponse?> getDetailInformation({
    required int? id,
  }) async {
    try {
      final detailResponse =
        await _dio.get('/recipes/$id/information', queryParameters: {'id': id});
      if(detailResponse.statusCode == 200){
        return DetailRecipeResponse.fromJson(detailResponse.data);
      }else{
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
