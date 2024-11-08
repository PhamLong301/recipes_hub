import 'package:get/get.dart';
import 'package:recipes_hub/api_service/spoonacular_api.dart';
import 'package:recipes_hub/model/detail_recipe_reponse.dart';
import 'package:recipes_hub/model/recipes_response.dart';

class RecipesController extends GetxController {
  final RxList<ResultsResponse> recipes = <ResultsResponse>[].obs;
  final RxBool isLoadingList = false.obs;
  final RxBool isLoadingAll = false.obs;

  final Rxn<DetailRecipeResponse> detailRecipeResponse = Rxn<DetailRecipeResponse>();
  final SpoonacularApi spoonacularApi = SpoonacularApi();

  final int pageSize = 10;
  int skipSize = 0;
  int? totalSize;

  bool get canLoadMore => (recipes.length < (totalSize ?? 0));

  Future<void> getRecipes({bool isLoadingMore = false}) async {
    setLoadingState(isLoadingMore);
    final RecipesResponse? response = await spoonacularApi.fetchRecipes(
      currentSize: pageSize,
      skipSize: skipSize,
    );
    resetLoadingState(isLoadingMore);
    if (response != null) {
      totalSize = response.totalResults ?? 0;
      recipes.addAll(response.results ?? []);
    } else {
      handleError();
    }
    print('Loaded products: ${recipes.length}');
  }

  Future<void> loadMoreProducts() async {
    if (canLoadMore) {
      skipSize += pageSize;
      await getRecipes(isLoadingMore: true);
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

  Future<void> getDetailRecipe({
    required int? id,
  }) async {
    DetailRecipeResponse? detailResponse =
        await spoonacularApi.getDetailInformation(id: id);
    if(detailResponse != null){
      detailRecipeResponse.value = detailResponse;
    }else{
      handleError();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getRecipes();
  }
}
