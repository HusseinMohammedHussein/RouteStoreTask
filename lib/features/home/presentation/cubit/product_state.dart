part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

// Get All Product ..
final class ProductsLoadingState extends ProductState {}

final class ProductsSuccessState extends ProductState {
  ProductsSuccessState({required this.products});

  List<ProductModel> products = [];
}

final class ProductsErrorState extends ProductState {}

final class SearchResultsState extends ProductState {}
