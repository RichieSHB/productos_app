import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key, this.url}) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          width: double.infinity,
          height: 450,
          decoration: _buildBoxDecorationProductImage(),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: url == null
                ? const Image(
                    image: AssetImage('assets/no-image.png'),
                    fit: BoxFit.cover,
                  )
                : FadeInImage(
                    placeholder: const AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage(url!),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecorationProductImage() => BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ]);
}
