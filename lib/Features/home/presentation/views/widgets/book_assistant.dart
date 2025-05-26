import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/home/data/models/book_model.dart';
import 'package:iqra_library_app/core/cohere_service.dart';

class BookAssistant {
  static void show(BuildContext context, BookModel bookModel) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (_) => FutureBuilder<String>(
            future: CohereService.askAI(bookModel.title, bookModel.description),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                );
              }

              final response = snapshot.data?.trim();
              final isEmpty = response == null || response.isEmpty;

              if (isEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        '⚠️ The assistant could not understand the content of this book.',
                      ),
                    ),
                  );
                });
                return const SizedBox.shrink();
              }

              final parts = _splitResponse(response);

              return Padding(
                padding: EdgeInsets.only(
                  top: 16 + MediaQuery.of(context).padding.top,
                  left: 24,
                  right: 24,
                  bottom: 24,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 500),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 12),
                          Center(
                            child: Text(
                              '📘 Book Assistant',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (int i = 0; i < parts.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 16,
                                      ),
                                      child: Text(
                                        '${i + 1}. ${parts[i].trim()}',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium?.copyWith(
                                          height: 1.6,
                                          fontSize: 15.5,
                                        ),
                                      ),
                                    ),
                                  const SizedBox(height: 32),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () => Navigator.pop(context),
                          tooltip: 'Close',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }

  static List<String> _splitResponse(String response) {
    final parts = response.split(RegExp(r'\n\d+\.\s'));
    return parts.where((part) => part.trim().isNotEmpty).toList();
  }
}
