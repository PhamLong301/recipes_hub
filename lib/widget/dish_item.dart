import 'package:flutter/material.dart';

class DishItem extends StatefulWidget {
  const DishItem({super.key, required this.widthSize, required this.heightSize, required this.marginSize});
  final double widthSize;
  final double heightSize;
  final EdgeInsetsGeometry marginSize;
  @override
  State<DishItem> createState() => _DishItemState();
}

class _DishItemState extends State<DishItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.widthSize,
      height: widget.heightSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1, // Border width
        ),
      ),
      margin: widget.marginSize,
      child: Stack(
        children: [
          // Image.network('aaa'),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Color(0xff70B9BE),
          //   ),
          // ),
          const Positioned(
            right: 5,
            top: 5,
            child: Icon(Icons.favorite_border),
          ),
          const Positioned(
            left: 5,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dish name'),
                Row(
                  children: [
                    Row(children: [
                      Icon(Icons.timer),
                      Text('10 phut')
                    ],),
                    SizedBox(width: 20,),
                    Row(children: [
                      Icon(Icons.person),
                      Text('10')
                    ],),
                    SizedBox(width: 20,),
                    Row(children: [
                      Icon(Icons.star),
                      Text('4.5')
                    ],),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
