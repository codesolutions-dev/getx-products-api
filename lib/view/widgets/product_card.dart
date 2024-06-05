import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  final String imagePath, title;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: const Color.fromARGB(10, 0, 0, 0),
          child: AspectRatio(
            aspectRatio: 0.9,
            child: CachedNetworkImage(
              imageUrl: imagePath,
              fit: BoxFit.cover,
              // placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/images/placeholder.png'),
            ),
          ),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        title,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      const SizedBox(height: 2),
      Text(
        '\$$price',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}
