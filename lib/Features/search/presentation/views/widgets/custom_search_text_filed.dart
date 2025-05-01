import 'package:flutter/material.dart';

class CustomSearchTextFiled extends StatelessWidget {
  final void Function(String)? onSubmitted;

  const CustomSearchTextFiled({super.key, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
