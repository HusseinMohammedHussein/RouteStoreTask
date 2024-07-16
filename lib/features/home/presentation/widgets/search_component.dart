import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:route_store_task/features/home/home.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({required this.cubit, super.key});
  final ProductCubit cubit;



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: TextFormField(
          onChanged: cubit.search,
          decoration: InputDecoration(
              hintText: 'what do you search for?',
              hintStyle: const TextStyle(color: gray),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: steelBlue)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: steelBlue)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: steelBlue)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: steelBlue)),
              prefixIcon: const Icon(
                Icons.search,
                size: 25,
                color: steelBlue,
              )
          ),
        )),
        20.width,
        const Icon(
          Icons.shopping_cart_outlined,
          color: steelBlue,
        )
      ],
    );
  }
}
