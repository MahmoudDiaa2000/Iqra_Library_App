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
        Uri.tryParse(url)?.hasAbsolutePath == true &&
        Uri.parse(url).scheme.startsWith('http') &&
        await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No page available for this book')),
      );
    }
  }

  String? _getValidUrl(BookModel book) {
    if (_isValidUrl(book.buyLink)) return book.buyLink;
    if (_isValidUrl(book.infoLink)) return book.infoLink;
    if (_isValidUrl(book.previewLink)) return book.previewLink;
    if (_isValidUrl(book.accessLink)) return book.accessLink;
    return null;
  }

  bool _isValidUrl(String? url) {
    if (url == null || url.trim().isEmpty) return false;
    final uri = Uri.tryParse(url);
    return uri != null && uri.hasAbsolutePath && uri.scheme.startsWith('http');
  }

  @override
  Widget build(BuildContext context) {
    final isFree = bookModel.isFree;
    final hasPrice =
        bookModel.price != null && bookModel.price!.trim().isNotEmpty;
    final validUrl = _getValidUrl(bookModel);
    var isLinkAvailable = validUrl != null;

    String buttonLabel;
    if (!isLinkAvailable) {
      buttonLabel = 'Unavailable';
    } else if (isFree) {
      buttonLabel = 'Free';
    } else if (hasPrice) {
      buttonLabel = '\$${bookModel.price!}';
    } else {
      buttonLabel = 'Unavailable';
      isLinkAvailable = false;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: buttonLabel,
              backgroundColor:
                  isLinkAvailable ? Colors.amber : Colors.grey.shade300,
              textColor: Theme.of(context).colorScheme.onPrimary,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              onPressed:
                  isLinkAvailable
                      ? () => _launchIfValid(context, validUrl)
                      : null,
            ),
          ),
        ],
      ),
    );
  }
}

