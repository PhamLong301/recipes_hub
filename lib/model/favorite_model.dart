import 'package:recipes_hub/model/recipes_response.dart';

class FavoriteResponse {
  String? userId;
  List<ResultsResponse>? result;

  FavoriteResponse(this.userId, this.result);
}