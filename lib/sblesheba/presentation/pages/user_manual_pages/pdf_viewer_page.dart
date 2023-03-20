import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

// class MyPDFViewer extends StatefulWidget {
//   const MyPDFViewer({super.key});
//
//   @override
//   _MyPDFViewerState createState() => _MyPDFViewerState();
// }

// class _MyPDFViewerState extends State<MyPDFViewer> {
//   String pathPDF = "";
//
//   @override
//   // void initState() {
//   //   super.initState();
//   //   fromAsset('assets/pdf/buet.pdf', 'buet.pdf').then((f) {
//   //     setState(() {
//   //       pathPDF = f.path;
//   //     });
//   //   });
//   // }
//
//   // Future<File> fromAsset(String asset, String filename) async {
//   //   Completer<File> completer = Completer();
//   //   try {
//   //     var dir = await getApplicationDocumentsDirectory();
//   //     File file = File("${dir.path}/$filename");
//   //     var data = await rootBundle.load(asset);
//   //     var bytes = data.buffer.asUint8List();
//   //     await file.writeAsBytes(bytes, flush: true);
//   //     completer.complete(file);
//   //   } catch (e) {
//   //     throw Exception('Error parsing asset file!');
//   //   }
//   //   return completer.future;
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     final themeData = Theme.of(context);
//     return MaterialApp(
//       home: Scaffold(body: Builder(
//         builder: (BuildContext context) {
//           return Center(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       child: Text('Tap to Open Document',
//                           style: themeData.textTheme.headlineMedium
//                               ?.copyWith(fontSize: 21.0)),
//                       onPressed: () {
//                         debugPrint(pathPDF.toString());
//                         if (pathPDF.isNotEmpty) {
//                           debugPrint(pathPDF.toString());
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) => PDFScreen(path: pathPDF),
//                           //   ),
//                           // );
//                         }
//                       },
//                     )
//                   ]));
//         },
//       )),
//     );
//   }
// }

class PDFScreen extends StatefulWidget {
  final String assetPath;

  const PDFScreen({Key? key, required this.assetPath}) : super(key: key);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  String pdfFileName = "sample.pdf";

  late String devicePDFPath = "";
  late final Future<File> devicePDFFile;

  @override
  void initState() {
    super.initState();
    devicePDFFile = fromAsset(widget.assetPath, pdfFileName);
    devicePDFFile.then((value) => devicePDFPath = value.path);
    // debugPrint(devicePDFPath);
  }

  Future<File> fromAsset(String assetPath, String pdfFileName) async {
    debugPrint("from asset called");

    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$pdfFileName");
      var data = await rootBundle.load(assetPath);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
    return completer.future;
  }

  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Back"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: FutureBuilder<File>(
        future: devicePDFFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if(snapshot.hasData) {
            debugPrint(devicePDFPath);
            return Stack(
              children: <Widget>[
                PDFView(
                  filePath: devicePDFPath,
                  onRender: (_pages) {
                    setState(() {
                      pages = _pages;
                      isReady = true;
                    });
                  },
                  onError: (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
                    print(error.toString());
                  },
                  onPageError: (page, error) {
                    setState(() {
                      errorMessage = '$page: ${error.toString()}';
                    });
                    print('$page: ${error.toString()}');
                  },
                  onViewCreated: (PDFViewController pdfViewController) {
                    _controller.complete(pdfViewController);
                  },
                ),
                errorMessage.isEmpty
                    ? !isReady
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : Container()
                    : Center(
                  child: Text(errorMessage),
                )
              ],
            );
          } else {
            return const Text("Nothing to show");
          }
        }
      ),
    );
  }
}
