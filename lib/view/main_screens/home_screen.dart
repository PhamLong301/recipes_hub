import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:recipes_hub/controller/random_recipes_controller.dart';
import 'package:recipes_hub/model/random_recipes.dart';
import 'package:recipes_hub/widget/dish_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RandomRecipesController randomRecipesController;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    randomRecipesController = Get.put(RandomRecipesController());
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        randomRecipesController.loadMoreProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text('Chào ngày mới'),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text("Hôm nay bạn muốn nấu món gì?"),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text('Chao! User'),
            // ),
        /*    Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tìm gần đây'),
                  InkWell(
                    child: Text('Tất cả'),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () {
                    if (randomRecipesController.isLoadingAll.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<RecipesModel> recipes =
                          randomRecipesController.recipes;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        itemCount: randomRecipesController.recipes.length,
                        itemBuilder: (context, index) {
                          return DishItem(
                            widthSize: MediaQuery.of(context).size.width,
                            heightSize: 200,
                            marginSize: const EdgeInsets.only(right: 10),
                            urlImage: recipes[index].image ?? '',
                            dishName: recipes[index].title ?? '',
                            servingsQuantity: recipes[index].servings ?? 0,
                            score: recipes[index].spoonacularScore ?? 0,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Đề xuất cho bạn'),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                    () {
                      if (randomRecipesController.isLoadingAll.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<RecipesModel> recipes =
                            randomRecipesController.recipes;
                        return NotificationListener(
                            child: Column(
                          children: [
                              Expanded(
                                child: ListView.builder(
                                controller: scrollController,
                                itemCount: randomRecipesController.recipes.length,
                                itemBuilder: (context, index) {
                                  return DishItem(
                                    widthSize: MediaQuery.of(context).size.width,
                                    heightSize: 200,
                                    marginSize: const EdgeInsets.only(bottom: 10),
                                    urlImage: recipes[index].image ?? '',
                                    dishName: recipes[index].title ?? '',
                                    servingsQuantity: recipes[index].servings ?? 0,
                                    score: recipes[index].spoonacularScore ?? 0,
                                  );
                                },
                                                          ),
                              ),
                            Obx(() {
                              if (randomRecipesController.isLoadingList.value) {
                                return const CircularProgressIndicator();
                              } else {
                                return const SizedBox();
                              }
                            })
                          ],
                        ));
                      }
                    },
                  ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 300, // Set a height for the bottom sheet
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 30,
                      child: Row(
                        children: [
                          Checkbox(
                            onChanged: (value) {},
                            value: false,
                          ),
                          const Text('Ingredient Filter'),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        child: const Icon(
          Ionicons.filter,
          color: Colors.white70,
        ),
        backgroundColor: const Color(0xff70B9BE),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
