import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra_library_app/core/utils/assets.dart';
import 'package:iqra_library_app/core/utils/styles.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(AssetsData.book1, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clean Code',
                  style: Styles.textStyle20.copyWith(
                    fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 3),
                const Text('Robert C.Martin', style: Styles.textStyle14),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      '20.00\$',
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
