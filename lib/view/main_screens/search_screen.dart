import 'package:flutter/material.dart';
import 'package:recipes_hub/widget/search_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchRecipesController;

  @override
  void initState() {
    searchRecipesController = TextEditingController();
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
                hintText: 'Find your recipes',
                searchFieldController: searchRecipesController,
              ),
              Divider(),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                  },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
