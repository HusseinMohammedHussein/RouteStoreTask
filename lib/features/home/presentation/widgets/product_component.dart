import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:route_store_task/features/home/data/model/product_model.dart';
import 'package:route_store_task/features/home/home.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: steelBlue)),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: size.width * 0.44,
                height: size.height * 0.14,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider('${product.thumbnail}'),
                      fit: BoxFit.fill),
                ),
              ).fit(fit: BoxFit.cover).center(),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black45,
                              blurRadius: 2,
                              blurStyle: BlurStyle.normal,
                              offset: Offset(0, 1),
                              spreadRadius: 0.1)
                        ],
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 23,
                      color: steelBlue,
                    )),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                5.height,
                Text(
                  product.title!,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
                Text(
                  product.description!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                5.height,
                Row(
                  children: [
                    Text('EGP ${product.discountPercentage}'),
                    15.width,
                    Text(
                      '${product.price} EGP',
                      style: const TextStyle(
                          color: steelBlue,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: steelBlue),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Text('Review (${product.rating})'),
                        5.width,
                        const Icon(
                          Icons.star,
                          color: gold,
                        ),
                      ],
                    )),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(
                        Icons.add,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
