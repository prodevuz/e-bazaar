import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/common/widgets/products/sortable/sortable_products.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ADAppBar(title: Text("Mashxur maxsulotlar"), showBackArrow: true),
      body: SingleChildScrollView(child: Padding(padding: EdgeInsets.all(ADSizes.defaultSpace), child: SortableProducts())),
    );
  }
}
