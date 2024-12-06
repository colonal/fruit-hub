import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return image == null
        ? Container(
            color: Colors.grey,
            height: 100,
            width: 100,
          )
        : Image.network(
            image!,
            fit: BoxFit.cover,
          );
  }
}
