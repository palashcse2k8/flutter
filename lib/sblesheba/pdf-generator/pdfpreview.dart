import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import 'pdfexport.dart';

class PdfPreviewPage extends StatelessWidget {
  // final Customer invoice;

  const PdfPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Information Preview'),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (context) => makePdf(),
      ),
    );
  }
}



