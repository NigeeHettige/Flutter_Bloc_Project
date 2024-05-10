// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutterbloc/features/cart/bloc/cart_bloc.dart';

import 'package:flutterbloc/features/home/model/home_product_data_model.dart';

class CartPost extends StatelessWidget {
  final ProductDataModel productdatamodel;
  final CartBloc cartBloc;

  const CartPost(
      {super.key, required this.productdatamodel, required this.cartBloc});

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
                    image: NetworkImage(productdatamodel.imageUrl))),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productdatamodel.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(productdatamodel.description),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "\$ ${productdatamodel.price}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    // widget.homeBloc.add(HomeProductWishlistButtonClickedEvent(
                    //     clickedProduct: widget.productdatamodel));
                  },
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {
                    cartBloc.add(CartRemoveFromCartEvent(
                        productDataModel: productdatamodel));
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
