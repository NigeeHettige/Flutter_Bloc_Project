import 'package:flutter/material.dart';

class WishListIconButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isAddedToWishList;
  
  const WishListIconButton({super.key, required this.onPressed, required this.isAddedToWishList});

  @override
  State<WishListIconButton> createState() => _WishListIconButtonState();
}

class _WishListIconButtonState extends State<WishListIconButton> {
  
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: widget.onPressed, icon: Icon(widget.isAddedToWishList?Icons.favorite:Icons.favorite_border),color:widget.isAddedToWishList?Colors.red:Colors.black,);
  }
}