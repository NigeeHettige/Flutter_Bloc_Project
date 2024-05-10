import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterbloc/data/cart_items.dart';
import 'package:flutterbloc/data/grocery_data.dart';
import 'package:flutterbloc/data/wishlist_items.dart';
import 'package:flutterbloc/features/home/model/home_product_data_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HometWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HometCartButtonNavigateEvent>(hometCartButtonNavigateEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonUnclickedEvent>(
        homeProductWishlistButtonUnclickedEvent);
    on<HomeProductCartButtonUnclickedEvent>(
        homeProductCartButtonUnclickedEvent);
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HometWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> hometCartButtonNavigateEvent(
      HometCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.clickedProduct);

    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartActionState());
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    try {
      emit(HomeLoadedSuccessState(
          products: GroceryData.groceryItems
              .map((e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  description: e['description'],
                  price: e['price'],
                  imageUrl: e['imageUrl']))
              .toList()));
    } catch (error) {
      emit(HomeErrorState());
    }
  }

  FutureOr<void> homeProductWishlistButtonUnclickedEvent(
      HomeProductWishlistButtonUnclickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.remove(event.unclickedProduct);

    emit(HomeProductItemRemoveWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonUnclickedEvent(
      HomeProductCartButtonUnclickedEvent event, Emitter<HomeState> emit) {
    cartItems.remove(event.unclickedProduct);
    emit(HomeProductItemRemoveCartActionState());
  }
}
