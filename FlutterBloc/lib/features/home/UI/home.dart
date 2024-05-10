import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/features/cart/UI/cart.dart';
import 'package:flutterbloc/features/home/UI/product_post.dart';
import 'package:flutterbloc/features/home/bloc/home_bloc.dart';
import 'package:flutterbloc/features/wishlist/UI/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Wishlist()));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Wishlisted')));
        } else if (state is HomeProductItemCartActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Carted')));
        } else if (state is HomeProductItemRemoveWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item Remove From Wishlist')));
        } else if (state is HomeProductItemRemoveCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item Remove From Cart')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          // ignore: type_literal_in_constant_pattern
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          // ignore: type_literal_in_constant_pattern
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Grocery App',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HometWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HometCartButtonNavigateEvent());
                      },
                      icon: const Icon(
                        Icons.shopping_cart_checkout_outlined,
                        color: Colors.white,
                      )),
                ],
                backgroundColor: const Color.fromARGB(255, 1, 102, 109),
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductPost(
                        productdatamodel: successState.products[index],
                        homeBloc: homeBloc);
                  }),
            );

          // ignore: type_literal_in_constant_pattern
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
