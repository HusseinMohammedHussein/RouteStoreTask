import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:route_store_task/core/services/service_locator.dart';
import 'package:route_store_task/core/utils/custom_scaffold.dart';
import 'package:route_store_task/features/home/home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (c, state) {},
        builder: (c, state) {
          final cubit = sl<ProductCubit>();

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.height,
                // Header section
                Image.asset(
                  'assets/logo_app.png',
                  width: 100,
                  height: 60,
                ),
                15.height,
                // Searchbar section
                SearchComponent(
                  cubit: cubit,
                ),
                50.height,
                if (state is ProductsLoadingState)
                  const CircularProgressIndicator().center()
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.searchProduct?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) =>
                        ProductComponent(product: cubit.searchProduct![index]),
                  ),
              ],
            ),
          );
        },
      ),
    ));
  }
}
