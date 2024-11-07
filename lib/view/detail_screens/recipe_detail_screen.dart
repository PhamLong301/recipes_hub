import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../model/random_recipes.dart';

class RecipeDetailScreen extends StatelessWidget {
  final RecipesModel recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title ?? '')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                recipe.image ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              SizedBox(height: 16),
              Text(
                recipe.title ?? '',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              HtmlWidget(
                recipe.summary ?? '',
                textStyle: TextStyle(fontSize: 10,
                color: Colors.grey), // tùy chỉnh kiểu chữ
              ),
              SizedBox(height: 16),
              Text('Điểm sức khỏe: ${recipe.healthScore ?? ''}'),
              SizedBox(height: 16),
              Text('Điểm đánh giá: ${recipe.spoonacularScore ?? ''}'),
            ],
          ),
        ),
      ),
    );
  }
}
