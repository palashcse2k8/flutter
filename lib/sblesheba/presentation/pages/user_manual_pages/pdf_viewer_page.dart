import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../datamodel/navigation_item.dart';
import '../../../provider/navigationprovider.dart';

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
    pdfFileName = widget.assetPath.split('/').last;
    devicePDFFile = fromAsset(widget.assetPath, pdfFileName);
    devicePDFFile.then((value) => devicePDFPath = value.path);
    // debugPrint(devicePDFPath);
  }

  Future<File> fromAsset(String assetPath, String pdfFileName) async {
    // debugPrint("from asset called");

    String? syncPath ;

    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      syncPath = "${dir.path}/$pdfFileName";
      debugPrint(syncPath);
      File file = File(syncPath);

      if (await File(syncPath).exists()) {
        // debugPrint("file exits");
        completer.complete(file);
      } else {
        // debugPrint("file not exits");
        var data = await rootBundle.load(assetPath);
        var bytes = data.buffer.asUint8List();
        await file.writeAsBytes(bytes, flush: true);
        completer.complete(file);
      }
    } catch (e) {
      debugPrintStack();
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

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            final provider =
            Provider.of<DrawerNavigationProvider>(context, listen: false);
            provider.setNavigationItem(DrawerNavigationItem.userManual);
          },
        ),
        title: const Text("Back"),
        centerTitle: true,
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
                    // print(error.toString());
                  },
                  onPageError: (page, error) {
                    setState(() {
                      errorMessage = '$page: ${error.toString()}';
                    });
                    // print('$page: ${error.toString()}');
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
            return const CircularProgressIndicator();
          }
        }
      ),
    );
  }
}
