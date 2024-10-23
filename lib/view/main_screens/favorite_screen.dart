import 'package:flutter/material.dart';

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
