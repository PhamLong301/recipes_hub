import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('Home'),
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
