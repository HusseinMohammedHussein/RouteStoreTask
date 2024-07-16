import 'package:dartz/dartz.dart';
import 'package:route_store_task/core/database/api/api_consumer.dart';
import 'package:route_store_task/core/database/api/end_point.dart';
import 'package:route_store_task/core/error/exception.dart';
import 'package:route_store_task/core/error/failure.dart';
import 'package:route_store_task/core/services/service_locator.dart';
import 'package:route_store_task/features/home/data/model/product_model.dart';

class ProductRepository {
  Future<Either<Failure, GetAllProducts>> getProducts() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoint.products)as Map<String, dynamic>;
      return Right(GetAllProducts.fromJson(response));
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
