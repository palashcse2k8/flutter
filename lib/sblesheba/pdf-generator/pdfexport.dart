import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import 'model.dart';

Future<Uint8List> makePdf() async {
  final pdf = await generatePdf();
  File file = await saveDocument(name: "example.pdf", pdf: pdf);

  return file.readAsBytes();
}

Future<Document> generatePdf() async {
  final imageLogo = MemoryImage(
      (await rootBundle.load(Customer.imageLocation)).buffer.asUint8List());

  final font = await PdfGoogleFonts.aleoLightItalic();
  final pdf = Document();
  const pageTheme = PageTheme(
    pageFormat: PdfPageFormat.a4,
  );
  pdf.addPage(
    Page(
        pageFormat: PdfPageFormat.a4,
        build: (Context context) {
          return Container(
              child: Column(children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: pageTheme.pageFormat.availableWidth,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: MemoryImage(imageLogo.bytes)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 120,
                  decoration: const BoxDecoration(shape: BoxShape.rectangle),
                  child: Placeholder(),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 100,
                  height: 120,
                  decoration: const BoxDecoration(shape: BoxShape.rectangle),
                  child: Placeholder(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text('Name of the branch: ${Customer.nameOfBranch}',
                  style: TextStyle(
                      font: font, fontSize: 15, fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Text('Account Number: ${Customer.accountNumber}',
                  style: TextStyle(
                      font: font, fontSize: 15, fontWeight: FontWeight.bold)),
            ]),
            SizedBox(
              width: 10,
            ),

            Container(
              width: double.infinity,
              child: Table(
                border: const TableBorder(left: BorderSide(color: PdfColors.white, width: 1 )),
                children: [
                  addTableRow('Applicant\'s name', Customer.name.toUpperCase()),
                  addTableRow('Nid\BRC', Customer.nid),
                  addTableRow('Father\'s name', Customer.fathersName.toUpperCase()),
                  addTableRow('Mother\'s name', Customer.mothersName.toUpperCase()),
                  addTableRow('Sopuse Name (If Applicable)', Customer.spouseName.toUpperCase()),
                  addTableRow('Date of Birth', Customer.dateOfBirth),
                  addTableRow('Gender (M/F/T)', Customer.gender),
                  addTableRow('Profession', Customer.profession),
                  addTableRow('Mobile No', Customer.mobileNumber),
                  addTableRow('Present Address', Customer.presentAddress),
                  addTableRow('Permanent Address', Customer.permanentAddress),
                  addTableRow('Nominee Name', Customer.nomineeName),
                ],
              ),
            ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Speciman Signature/Digital Signature (Where necessary) :"
                  ),
                )

          ]));
        }),
  );
  return pdf;
}

TableRow addTableRow (String option, String value) {
   return TableRow(
       children: [
         Text(option,
             textAlign: TextAlign.left,
             style: TextStyle(fontWeight: FontWeight.normal)),
         Text(': $value',
             textAlign: TextAlign.left,
             style: TextStyle(fontWeight: FontWeight.normal)),
       ]);
 }

Future<File> saveDocument({
  required String name,
  required Document pdf,
}) async {
  final bytes = await pdf.save();

  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/$name');

  await file.writeAsBytes(bytes);

  return file;
}
