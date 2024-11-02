import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widget/dish_item.dart';
import '../../widget/search_field.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late TextEditingController searchFavoriteController;

  @override
  void initState() {
    searchFavoriteController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchField(
                hintText: 'Find your favorites',
                searchFieldController: searchFavoriteController,
              ),
              Divider(),
              // Expanded(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: 5,
              //     itemBuilder: (context, index) {
              //       return DishItem(
              //         widthSize: MediaQuery.of(context).size.width,
              //         heightSize: 200,
              //         marginSize: EdgeInsets.only(bottom: 10),
              //       );
              //     },),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
