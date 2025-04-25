import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SafeArea(child: CustomBookDetailsAppBar())
        ],
      ),
    );
  }
}



