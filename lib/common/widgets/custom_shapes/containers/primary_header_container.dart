import 'package:flutter/material.dart';
import 'package:ebazaar/utils/constants/colors.dart';
import 'package:ebazaar/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ebazaar/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: ADColors.primary,
        child: Stack(children: [
          Positioned(top: -150, right: -250, child: CircularContainer(backgroundColor: ADColors.textWhite.withOpacity(0.1))),
          Positioned(top: 100, right: -300, child: CircularContainer(backgroundColor: ADColors.textWhite.withOpacity(0.1))),
          child,
        ]),
      ),
    );
  }
}
