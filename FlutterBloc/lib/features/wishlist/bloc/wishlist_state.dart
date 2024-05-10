// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}


abstract class WishListActionState extends WishlistState{

}




// ignore: must_be_immutable
class WishListLoadedSuccessState extends WishlistState {
    List<ProductDataModel> wishlistItems;

  WishListLoadedSuccessState({
    required this.wishlistItems,
  });
}
