import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';
import 'package:iqra_library_app/core/utils/assets.dart';
import 'package:iqra_library_app/core/utils/styles.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: SizedBox(
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Clean Code',
                      style: Styles.textStyle20.copyWith(
                        fontFamily: GoogleFonts
                            .playfairDisplay()
                            .fontFamily,
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
                        Spacer(),

                        Padding(
                          padding: EdgeInsets.only(right: MediaQuery
                              .of(context)
                              .size
                              .width * 0.05,
                              left: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.05),
                          child: const BookRating(),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
