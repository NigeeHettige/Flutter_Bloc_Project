import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/data/wishlist_items.dart';
import 'package:flutterbloc/features/wishlist/UI/wishlist_post.dart';
import 'package:flutterbloc/features/wishlist/bloc/wishlist_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  void initState() {
    wishlistBloc.add(WishListInitialEvent());
    super.initState();
  }

  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wishlist",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 1, 102, 109),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishListActionState,
        buildWhen: (previous, current) => current is! WishListActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishListLoadedSuccessState:
              final successState = state as WishListLoadedSuccessState;
              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishListPost(
                        productdatamodel: successState.wishlistItems[index],
                        wishlistBloc: wishlistBloc);
                  });
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
