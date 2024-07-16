import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_store_task/core/services/service_locator.dart';
import 'package:route_store_task/features/home/home.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (c, state) => BlocProvider(
        create: (c) => sl<ProductCubit>()..getAllProducts(),
        child: const Home(),
      ),
    ),
  ],
);
