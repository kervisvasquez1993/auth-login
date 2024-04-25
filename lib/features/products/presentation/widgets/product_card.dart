import 'package:flutter/widgets.dart';
import 'package:teslo_shop/features/products/domain/domain.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ImageViewr(images: product.images),
        Text(product.title),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageViewr extends StatelessWidget {
  final List<String> images;
  const _ImageViewr({required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://www.ortizco.cl/images/contenido-no-disponible.jpg',
            fit: BoxFit.cover,
            height: 250,
          ));
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
          image: NetworkImage(images.first)),
    );
  }
}
