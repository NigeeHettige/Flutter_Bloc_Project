import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterbloc/data/wishlist_items.dart';
import 'package:flutterbloc/features/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
   on<WishlistRemoveItemEvent>(wishlistRemoveItemEvent);
  }

  FutureOr<void> wishlistRemoveItemEvent(WishlistRemoveItemEvent event, Emitter<WishlistState> emit) {
    
    wishlistItems.remove(event.productDataModel);
    emit(WishListLoadedSuccessState(wishlistItems: wishlistItems));


  }

  

  FutureOr<void> wishListInitialEvent(WishListInitialEvent event, Emitter<WishlistState> emit) {
   emit(WishListLoadedSuccessState(wishlistItems: wishlistItems));
  }
}


