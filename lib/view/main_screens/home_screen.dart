import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:recipes_hub/controller/scrol_statel_controller.dart';
import 'package:recipes_hub/widget/dish_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollStateController scrollStateController = Get.put(ScrollStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tìm gần đây'),
                        InkWell(
                          child: Text('Tất cả'),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 160,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return DishItem(
                              widthSize: 250,
                              heightSize: 100,
                              marginSize: EdgeInsets.only(right: 10),
                            );
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Đề xuất cho bạn'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Obx(() => ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          physics: scrollStateController.isAtTop.value
                              ? AlwaysScrollableScrollPhysics()
                              : NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return DishItem(
                              widthSize: MediaQuery.of(context).size.width,
                              heightSize: 200,
                              marginSize: EdgeInsets.only(bottom: 10),
                            );
                          },
                        ),)
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 30,
                    child: Row(
                      children: [
                        Expanded(
                            child: Checkbox(
                          onChanged: (value) {},
                          value: false,
                        )),
                        Expanded(
                          child: Text('Ingredient Filter'),
                        ),
                      ],
                    ),
                  );
                },
                // shrinkWrap: true,
                itemCount: 10,
              );
            },
          );
        },
        child: Icon(
          Ionicons.filter,
          color: Colors.white70,
        ),
        backgroundColor: Color(0xff70B9BE),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
