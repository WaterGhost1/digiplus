import 'package:flutter/material.dart';

// THIS IS JUST THE DESIGN OF THE TILE!
// FOR FUNCTIONS REFER TO shopping_item.dart!!!

// ignore: must_be_immutable
class ShoppingItemTile extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final containerColor;
  void Function()? onPressed;

  ShoppingItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.containerColor,
    required this.onPressed,
  });

  @override
  State<ShoppingItemTile> createState() => _ShoppingItemTileState();
}

class _ShoppingItemTileState extends State<ShoppingItemTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(widget.imagePath, height: 90),
          Text(widget.itemName, style: TextStyle(fontWeight: FontWeight.bold)),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onPressed: widget.onPressed,
            color: Color(0xff392a48),
            child: Text(
              '\$' + widget.itemPrice,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
