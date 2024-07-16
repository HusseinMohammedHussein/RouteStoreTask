import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_store_task/core/database/api/api_consumer.dart';
import 'package:route_store_task/core/database/api/dio_consumer.dart';
import 'package:route_store_task/features/home/home.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl..registerSingleton<ProductRepository>(ProductRepository())
    ..registerSingleton<Dio>(Dio())
    ..registerSingleton<ProductCubit>(ProductCubit(sl()))
    ..registerSingleton<ApiConsumer>(DioConsumer(sl()));
}
