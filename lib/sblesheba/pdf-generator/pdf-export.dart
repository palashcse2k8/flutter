import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

import 'generate-branch-style-account-report.dart';

Future<Uint8List> makePdf() async {
  // final pdf = await generatePdf();
  final pdf = await generateAccountInformationPdf();

  File file = await saveDocument(name: "example.pdf", pdf: pdf);
  return file.readAsBytes();
}

Future<File> saveDocument({
  required String name,
  required Document pdf,
}) async {
  final bytes = await pdf.save();

  // final dir = await getApplicationDocumentsDirectory();
  // final file = File('${dir.path}/$name');

  // final dir = await getDownloadsDirectory();
  // final dir = await getDirectory();

  final dir = await getDirectory();
  final file = File('$dir/$name');

  await file.writeAsBytes(bytes);

  return file;
}

Future<String?> getDirectory() async {
  String? downloadDirectory;
  if (Platform.isAndroid) {
    // final externalStorageFolder = await getExternalStorageDirectory();
    const downloadDirectory = "/storage/emulated/0/Download/";
    return downloadDirectory;
    // print(externalStorageFolder);
    // if (externalStorageFolder != null) {
    //   downloadDirectory = p.join(externalStorageFolder.path, "Downloads");
    // }
  } else {
    final downloadFolder = await getDownloadsDirectory();
    if (downloadFolder != null) {
      downloadDirectory = downloadFolder.path;
    }
    return downloadDirectory.toString();
  }

}
