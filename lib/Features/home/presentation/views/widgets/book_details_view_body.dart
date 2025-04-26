import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:iqra_library_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:iqra_library_app/core/utils/styles.dart';
import 'package:iqra_library_app/core/widgets/custom_button.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key });
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SafeArea(child: const CustomBookDetailsAppBar()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.17),
            child: CustomBookImage(),

          ),
          const SizedBox(
            height: 43,
          ),
          Text('Clean Code',
            style: Styles.textStyle30,),
          const SizedBox(
            height: 6,
          ),
          Text(' Robert C. Martin',
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic
            ),),
          const SizedBox(
            height: 18,
          ),
          BookRating(mainAxisAlignment: MainAxisAlignment.center,),
          const SizedBox(
            height: 40,
          ),
          const BooksAction()



        ],
      ),
    );
  }
}


class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(child:
          CustomButton(
            text: '20.00\$',
            backgroundColor: Colors.grey,
            textColor: Colors.black87,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16)
            ),
          ),
          ),
          Expanded(child:
          CustomButton(
            text: 'Free preview',
            backgroundColor: Colors.amber,
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)
            ),
          ),
          ),
        ],
      ),
    );
  }
}
