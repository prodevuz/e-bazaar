import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ADAppBar(
        title: Text("Do'kon", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CartCounterIcon(onPressed: () {}, iconColor: ADColors.white,),
        ],
      ),
    );
  }
}
