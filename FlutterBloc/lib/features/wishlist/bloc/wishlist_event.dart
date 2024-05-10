part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent{
  
}

class WishlistRemoveItemEvent extends WishlistEvent{
  final ProductDataModel productDataModel;

  WishlistRemoveItemEvent({required this.productDataModel});
}