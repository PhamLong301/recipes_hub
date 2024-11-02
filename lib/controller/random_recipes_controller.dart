import 'package:get/get.dart';
import 'package:recipes_hub/api_service/spoonacular_api.dart';

import '../model/random_recipes.dart';

class RandomRecipesController extends GetxController {
  final RxList<RecipesModel> recipes = <RecipesModel>[].obs;
  final RxBool isLoadingList = false.obs;
  final RxBool isLoadingAll = false.obs;

  final SpoonacularApi spoonacularApi = SpoonacularApi();

  final int pageSize = 4;
  int skipSize = 10;
  int? totalSize;

  bool get canLoadMore => (recipes.length < (totalSize ?? 0));

  Future<void> getRandomRecipes({bool isLoadingMore = false}) async {
    setLoadingState(isLoadingMore);
    final RandomRecipesResponse? response =
        await spoonacularApi.fetchRandomRecipes(
      currentSize: pageSize,
      skipSize: skipSize,
    );
    resetLoadingState(isLoadingMore);
    if (response != null) {
      totalSize = response.totalResults ?? 0;
      recipes.addAll(response.recipes ?? []);
    } else {
      handleError();
    }
  }

  Future<void> loadMoreProducts() async {
    if (canLoadMore) {
      skipSize += pageSize;
      await getRandomRecipes(isLoadingMore: true);
    }
  }

  void setLoadingState(bool isLoadingMore) {
    if (isLoadingMore) {
      isLoadingList.value = true;
    } else {
      isLoadingAll.value = true;
    }
  }

  void resetLoadingState(bool isLoadingMore) {
    if (isLoadingMore) {
      isLoadingList.value = false;
    } else {
      isLoadingAll.value = false;
    }
  }

  void handleError() {
    Get.snackbar('Error Loading data!', ':((');
  }

  @override
  void onInit() async {
    super.onInit();
    await getRandomRecipes();
  }
}
