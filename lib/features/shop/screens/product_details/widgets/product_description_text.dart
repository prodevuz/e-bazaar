import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDescriptionText extends StatelessWidget {
  const ProductDescriptionText({super.key, this.text = "Bu yerda maxsulotning tavsifi bo'lishi kerak edi. Bu yerda maxsulotning tavsifi bo'lishi kerak edi. Bu yerda maxsulotning tavsifi bo'lishi kerak edi."});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: " Ko'proq",
      trimExpandedText: " Kamroq",
      moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
      lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
    );
  }
}
