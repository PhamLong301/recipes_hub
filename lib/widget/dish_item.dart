import 'package:flutter/material.dart';

class DishItem extends StatefulWidget {
  const DishItem({
    super.key,
    required this.widthSize,
    required this.heightSize,
    required this.marginSize,
    required this.urlImage,
    required this.dishName,
    required this.servingsQuantity,
    required this.score,
  });

  final double widthSize;
  final double heightSize;
  final EdgeInsetsGeometry marginSize;
  final String urlImage;
  final String dishName;
  final int servingsQuantity;
  final double score;

  @override
  State<DishItem> createState() => _DishItemState();
}

class _DishItemState extends State<DishItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.widthSize,
      height: widget.heightSize,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(10),
      //   border: Border.all(
      //     color: Colors.grey, // Border color
      //     width: 1, // Border width
      //   ),
      // ),
      margin: widget.marginSize,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              widget.urlImage,
              fit: BoxFit.cover,
              width: widget.widthSize,
              height: widget.heightSize,
            ),
          ),
          const Positioned(
            right: 5,
            top: 5,
            child: Icon(Icons.favorite, color: Colors.white,),
          ),
          Positioned(
            left: 5,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.dishName,
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  children: [
                    // Row(
                    //   children: [Icon(Icons.timer), Text('10 phut')],
                    // ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        Text(
                          '${widget.servingsQuantity} persons',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text('${widget.score}',
                        style: TextStyle(
                          color: Colors.white
                        ),)
                      ],
                    ),
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
