import 'package:flutter/material.dart';

class DishItem extends StatefulWidget {
  const DishItem({
    super.key,
    required this.widthSize,
    required this.heightSize,
    required this.marginSize,
    required this.urlImage,
    required this.dishName,
  });

  final double widthSize;
  final double heightSize;
  final EdgeInsetsGeometry marginSize;
  final String urlImage;
  final String dishName;

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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(3, 3),
          ),
        ],
      ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
