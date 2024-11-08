import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_hub/controller/recipes_controller.dart';
import 'package:recipes_hub/view/main_screens/search_screen.dart';
import 'package:recipes_hub/widget/dish_item.dart';
import 'package:recipes_hub/widget/drawer_list_view.dart';
import '../../model/recipes_response.dart';
import '../detail_screens/recipe_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RecipesController recipesController;
  final ScrollController scrollController = ScrollController();
  late TextEditingController searchController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    recipesController = Get.put(RecipesController());
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        recipesController.loadMoreProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        width: MediaQuery.of(context).size.width - 80,
        child: DrawerListView(),
      ),
      body: SafeArea(
        child: Obx(
          () {
            if (recipesController.isLoadingAll.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<ResultsResponse> recipes = recipesController.recipes;
              return NotificationListener(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              icon: Icon(Icons.account_circle)),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Chào Long!'),
                              Text('Hôm nay bạn đang tìm gì?'),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: () {
                                Get.to(SearchScreen());
                              },
                              icon: Icon(Icons.search)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Đề xuất cho bạn!',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: recipesController.recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = recipes[index];
                          return InkWell(
                            onTap: () {
                              Get.to(() => RecipeDetailScreen(
                                id: recipe.id,
                              ));
                            },
                            child: DishItem(
                              widthSize: MediaQuery.of(context).size.width,
                              heightSize: 200,
                              marginSize: const EdgeInsets.only(bottom: 30),
                              urlImage: recipes[index].image ?? '',
                              dishName: recipes[index].title ?? '',
                            ),
                          );
                        },
                      ),
                    ),
                    Obx(() {
                      if (recipesController.isLoadingList.value) {
                        return const CircularProgressIndicator();
                      } else {
                        return const SizedBox();
                      }
                    })
                  ],
                ),
              ));
            }
          },
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
          Icons.filter_list,
          color: Colors.white70,
        ),
        backgroundColor: const Color(0xff70B9BE),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
