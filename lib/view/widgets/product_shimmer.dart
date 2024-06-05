import 'package:flutter/material.dart';
import 'package:products_api/view/widgets/shimmer_widget.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      AspectRatio(
        aspectRatio: 0.9,
        child: ShimmerWidget.rectangular(
          height: 150,
          radius: 10,
        ),
      ),
      SizedBox(height: 10),
      ShimmerWidget.rectangular(
        height: 10,
        radius: 5,
      ),
      SizedBox(height: 10),
      Align(
        alignment: Alignment.centerLeft,
        child: ShimmerWidget.rectangular(
          width: 50,
          height: 12,
          radius: 5,
        ),
      )
    ]);
  }
}
