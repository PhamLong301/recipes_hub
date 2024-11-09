import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:recipes_hub/controller/recipes_controller.dart';
import 'package:recipes_hub/model/detail_recipe_reponse.dart';

class RecipeDetailScreen extends StatelessWidget {
  final int? id;

  RecipeDetailScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    final RecipesController controller = Get.put(RecipesController());
    controller.getDetailRecipe(id: id);
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.favorite),
      //     )
      //   ],
      // ),
      body: SafeArea(
        child: Obx(
          () {
            if (controller.detailRecipeResponse.value == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              DetailRecipeResponse? response =
                  controller.detailRecipeResponse.value;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          response?.image ?? '',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                        Positioned(
                          child: Row(
                            children: [
                              Expanded(
                                child: IconButton(
                                  onPressed: () => Get.back(),
                                  icon: Icon(
                                    Icons.arrow_back,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 280,
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  response?.title ?? '',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(onPressed: () {

                              }, icon: Icon(Icons.favorite_border))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${'serving'.tr}: ${response?.servings ?? 0}',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${'cooking_minutes'.tr}: ${response?.cookingMinutes ?? 0} m',
                              ),
                            ],
                          ),
                          HtmlWidget(
                            response?.summary ?? '',
                            textStyle: TextStyle(
                                fontSize: 10,
                                color: Colors.grey), // tùy chỉnh kiểu chữ
                          ),
                          SizedBox(height: 10),
                          Text('${'health_point'.tr}: ${response?.healthScore ?? ''}'),
                          SizedBox(height: 10),
                          Text(
                            '${'manufacturer_s_review'.tr}: ${response?.spoonacularScore?.toStringAsFixed(2) ?? ''}',
                          ),
                          Text('instructions'.tr,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),),
                          if (response?.analyzedInstructions != null)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: response
                                  ?.analyzedInstructions?[0].steps?.length,
                              itemBuilder: (context, index) {
                                final step = response
                                    ?.analyzedInstructions?[0].steps?[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    child: Text('${step?.number ?? 0}'),
                                  ),
                                  title:Text(step?.step ?? "No step description"),
                                );
                              },
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text("No cooking steps available"),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
