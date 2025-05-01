import 'package:flutter/material.dart';

class BooksLoadingWidget extends StatelessWidget {
  const BooksLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }
}
