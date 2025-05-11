import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/core/open_library_service.dart';
import 'package:iqra_library_app/core/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  final OpenLibraryBookModel bookModel;

  const BooksAction({super.key, required this.bookModel});

  Future<void> _launchReadLink(BuildContext context) async {
    final editionKey = bookModel.editionKey;
    if (editionKey == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No edition available for this book')),
      );
      return;
    }

    final service = OpenLibraryService();
    final details = await service.fetchBookDetailsByEditionKey(editionKey);
    final url =
        details?['preview_url'] ??
        details?['url'] ??
        'https://openlibrary.org/books/$editionKey';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No readable version available')),
      );
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
              text: 'Read',
              backgroundColor: Colors.amber,
              textColor: Colors.white,
              borderRadius: BorderRadius.circular(16),
              onPressed: () => _launchReadLink(context),
            ),
          ),
        ],
      ),
    );
  }
}
