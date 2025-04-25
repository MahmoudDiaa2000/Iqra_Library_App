import 'package:flutter/material.dart';
import 'package:iqra_library_app/core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.8 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          AssetsData.book1,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

