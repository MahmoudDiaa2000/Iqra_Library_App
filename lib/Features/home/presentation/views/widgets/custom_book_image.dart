import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final String imageUrl;

  const CustomBookImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final hasValidImage = imageUrl.trim().isNotEmpty;

    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child:
            hasValidImage
                ? Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 60),
                )
                : Container(
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.menu_book, size: 60),
                ),
      ),
    );
  }
}
