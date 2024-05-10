// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutterbloc/features/Icon/wishlistIcon.dart';
import 'package:flutterbloc/features/cart/bloc/cart_bloc.dart';

import 'package:flutterbloc/features/home/model/home_product_data_model.dart';
import 'package:flutterbloc/features/wishlist/bloc/wishlist_bloc.dart';

class WishListPost extends StatefulWidget {
  final ProductDataModel productdatamodel;
  final WishlistBloc wishlistBloc;
 

  const WishListPost(
      {super.key, required this.productdatamodel, required this.wishlistBloc});

  @override
  State<WishListPost> createState() => _WishListPostState();
}

class _WishListPostState extends State<WishListPost> {
   bool isAddedToWishlist = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black, width: 2.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.productdatamodel.imageUrl))),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.productdatamodel.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(widget.productdatamodel.description),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "\$ ${widget.productdatamodel.price}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              // IconButton(
              //     onPressed: () {
              //       widget.wishlistBloc.add(WishlistRemoveItemEvent(productDataModel: widget.productdatamodel));
              //     },
              //     icon: const Icon(
              //       Icons.favorite_border_outlined,
              //       color: Colors.black,
              //     )),

                   WishListIconButton(
                  onPressed: () {
                    widget.wishlistBloc.add(WishlistRemoveItemEvent(productDataModel: widget.productdatamodel));

                      setState(() {
                    isAddedToWishlist = isAddedToWishlist;
                  });

                  },
                  isAddedToWishList: !isAddedToWishlist),
              IconButton(
                  onPressed: () {
                  //  wishlistBloc.add(WishlistRemoveItemEvent(productDataModel: productdatamodel));
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
