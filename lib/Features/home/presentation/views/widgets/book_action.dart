import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/core/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  final BookModel bookModel;


  const BooksAction({super.key, required this.bookModel});

  Future<void> _launchIfValid(BuildContext context, String? url) async {
    if (url != null &&
        url.trim().isNotEmpty &&
        Uri
            .tryParse(url)
            ?.hasAbsolutePath == true &&
        Uri
            .parse(url)
            .scheme
            .startsWith('http') &&
        await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No page available for this book')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final isFree = bookModel.isFree;
    final hasPrice = bookModel.price != null &&
        bookModel.price!.trim().isNotEmpty;
    final buyLink = bookModel.buyLink;

    String? buttonLabel;
    if (isFree) {
      buttonLabel = 'Free';
    } else if (hasPrice) {
      buttonLabel = '\$${bookModel.price!}';
    } else {
      buttonLabel = 'Buy';
    }

    final url = bookModel.infoLink ?? bookModel.previewLink;



    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: buttonLabel,
              backgroundColor: Colors.amber,
              textColor: Theme
                  .of(context)
                  .colorScheme
                  .onPrimary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16)
              ),
              onPressed: () {
                final url = bookModel.infoLink ?? bookModel.previewLink;


                if (url == null ||
                    url
                        .trim()
                        .isEmpty ||
                    !Uri
                        .parse(url)
                        .isAbsolute) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No available online link for this book'),
                    ),
                  );
                  return;
                }

                _launchIfValid(context, url);
              },
            )

          ),
          // Expanded(
          //   child: CustomButton(
          //     text: 'Free Preview',
          //     backgroundColor: Colors.amber,
          //     textColor: Colors.white,
          //     borderRadius: const BorderRadius.only(
          //       topRight: Radius.circular(16),
          //       bottomRight: Radius.circular(16),
          //     ),
          //     onPressed: () => _launchIfValid(context, bookModel.previewLink),
          //   ),
          // )
          // ,
        ],
      ),
    );
  }
}

