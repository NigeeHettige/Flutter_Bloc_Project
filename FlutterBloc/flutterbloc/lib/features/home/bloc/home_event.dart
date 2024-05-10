part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeProductWishlistButtonUnclickedEvent extends HomeEvent {
  final ProductDataModel unclickedProduct;

  HomeProductWishlistButtonUnclickedEvent({required this.unclickedProduct});
}

class HomeProductCartButtonUnclickedEvent extends HomeEvent {
  final ProductDataModel unclickedProduct;

  HomeProductCartButtonUnclickedEvent({required this.unclickedProduct});
}

class HometWishlistButtonNavigateEvent extends HomeEvent {}

class HometCartButtonNavigateEvent extends HomeEvent {}
