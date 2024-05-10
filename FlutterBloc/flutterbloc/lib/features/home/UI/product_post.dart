// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutterbloc/features/home/bloc/home_bloc.dart';
import 'package:flutterbloc/features/home/model/home_product_data_model.dart';

class ProductPost extends StatelessWidget {
  final ProductDataModel productdatamodel;
  final HomeBloc homeBloc;

  const ProductPost(
      {super.key, required this.productdatamodel, required this.homeBloc});

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
                    homeBloc.add(HomeProductWishlistButtonClickedEvent(
                        clickedProduct: productdatamodel));
                  },
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(
                        clickedProduct: productdatamodel));
                  },
                  icon: const Icon(
                    Icons.shopping_cart_checkout_outlined,
                    color: Colors.black,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
