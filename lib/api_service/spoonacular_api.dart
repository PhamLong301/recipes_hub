import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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

  Future<RandomRecipesResponse?> fetchRandomRecipes({
    required int currentSize,
    required int skipSize,
}) async {
    try {
      final respone = await _dio.get('/recipes/random',
      queryParameters: {
'number' : currentSize,
'offSet' : skipSize,
      });
      if (respone.statusCode == 200) {
        try {
          return RandomRecipesResponse.fromJson(respone.data as Map<String, dynamic>);
        } catch (_) {
          return null;
        }
      }
    } catch (e) {
      return null;
    }
  }
}
