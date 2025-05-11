import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PDFViewerPage extends StatefulWidget {
  final String pdfUrl;

  const PDFViewerPage({super.key, required this.pdfUrl});

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    _downloadPDF();
  }

  Future<void> _downloadPDF() async {
    try {
      final response = await http.get(Uri.parse(widget.pdfUrl));
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/temp.pdf');
      await file.writeAsBytes(response.bodyBytes);
      setState(() {
        localPath = file.path;
      });
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Viewer")),
      body:
          localPath == null
              ? const Center(child: CircularProgressIndicator())
              : PDFView(
                filePath: localPath!,
                enableSwipe: true,
                swipeHorizontal: false,
                autoSpacing: false,
                pageSnap: true,
                pageFling: true,
              ),
    );
  }
}
