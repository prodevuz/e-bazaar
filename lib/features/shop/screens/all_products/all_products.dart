import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/features/shop/models/product_model.dart';
import 'package:ebazaar/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ebazaar/features/shop/controllers/all_products_controller.dart';
import 'package:ebazaar/common/widgets/products/sortable/sortable_products.dart';
import 'package:ebazaar/utils/helpers/cloud_helper_functions.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({
    super.key,
    this.query,
    this.futureMethod,
    required this.title,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = AllProductsController.instance;

    return Scaffold(
      appBar: ADAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // Check the state of the FutureBuilder snapshot
              const loader = ADVerticalProductShimmer();

              final widget = ADCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              if (widget != null) return widget;

              final products = snapshot.data!;

              return SortableProducts(products: products);
            },
          ),
        ),
      ),
    );
  }
  
}
