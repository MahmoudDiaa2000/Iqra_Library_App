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
        await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Link is not available')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: bookModel.isFree ? 'Free' : (bookModel.price ?? 'Buy'),
              backgroundColor: Theme.of(context).colorScheme.surface,
              textColor:
                  Theme.of(context).textTheme.bodyMedium?.color ??
                  Colors.black87,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              onPressed: () {
                final url =
                    bookModel.isFree ? bookModel.accessLink : bookModel.buyLink;
                _launchIfValid(context, url);
              },
            ),
          ),
          Expanded(
            child: CustomButton(
              text: 'Free Preview',
              backgroundColor: Colors.amber,
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              onPressed: () => _launchIfValid(context, bookModel.previewLink),
            ),
          ),
        ],
      ),
    );
  }
}
