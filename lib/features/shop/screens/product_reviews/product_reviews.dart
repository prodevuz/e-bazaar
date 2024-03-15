import 'package:ebazaar/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/sizes.dart';
import 'package:ebazaar/common/widgets/appbar/appbar.dart';
import 'package:ebazaar/common/widgets/products/ratings/rating_indicator.dart';
import 'package:ebazaar/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ADAppBar(title: Text("Fikrlar va reytinglar"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Fikr va mulohazalar tasdiqlangan va ular siz bilan bir xil turdagi qurilma ishlatadigan odamlar tomonidan yozilgan."),
              const SizedBox(height: ADSizes.spaceBtwItems),

              /// Overall Product Ratings
              const OverallProductRating(),
              const ADRatingBarIndicator(rating: 3.8),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: ADSizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
