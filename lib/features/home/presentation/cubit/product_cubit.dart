import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:route_store_task/features/home/data/model/product_model.dart';
import 'package:route_store_task/features/home/data/repository/product_repo.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepository) : super(ProductInitial());
  final ProductRepository _productRepository;

  List<ProductModel> products = [];

  List<ProductModel>? searchProduct;

  Future<void> getAllProducts() async {
    emit(ProductsLoadingState());

    final response = await _productRepository.getProducts();

    response.fold((l) => emit(ProductsErrorState()), (r) {
      products = r.products;
      searchProduct = products;
      emit(ProductsSuccessState(products: r.products));
    });
  }

  void search(String? key) {
    log('search_key: $key');
    if (products.isNotEmpty) {
      if (key!.isEmpty) {
        searchProduct = products;
      } else {
        searchProduct = products
            .where((element) =>
                element.title!.toLowerCase().contains(key.toLowerCase()))
            .toList();
      }
      emit(SearchResultsState());
    }
  }
}
