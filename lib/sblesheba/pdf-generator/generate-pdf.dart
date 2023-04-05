import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import 'image-converter.dart';
import 'model.dart';

Future<Document> generatePdf() async {
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/icons/sonali-bank-banner.jpg'))
          .buffer
          .asUint8List());

  final imageCustomer = MemoryImage(
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
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: MemoryImage(imageLogo.bytes)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  // width: 100,
                  // height: 120,
                  child: Column(
                    children: [
                      Text("Customer Photo"),
                      SizedBox(height: 10),
                      Image(
                        height: 120,
                          width: 100,
                          MemoryImage(imageCustomer.bytes)),

                      // getImageBase64(Customer.imageBase64),
                    ]
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  // width: 100,
                  // height: 120,
                  child: Column(
                      children: [
                        Text("Nominee Photo"),
                        SizedBox(height: 10),
                        Image(
                            height: 120,
                            width: 100,
                            MemoryImage(imageCustomer.bytes)),
                        // getImageBase64(Customer.imageBase64),
                      ]
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Name of the branch: ${Customer.nameOfBranch}',
                  style: TextStyle(
                      // font: font,
                      fontSize: 15, fontWeight: FontWeight.normal)),
              SizedBox(width: 10),
              Text('Account Number: ${Customer.accountNumber}',
                  style: TextStyle(
                      // font: font,
                      fontSize: 15, fontWeight: FontWeight.normal)),
            ]),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Table(
                border: const TableBorder(
                    left: BorderSide(color: PdfColors.white, width: 1)),
                children: [
                  addTableRow('Applicant\'s name', Customer.name.toUpperCase()),
                  addTableRow('Nid/BRC', Customer.nid),
                  addTableRow(
                      'Father\'s name', Customer.fathersName.toUpperCase()),
                  addTableRow(
                      'Mother\'s name', Customer.mothersName.toUpperCase()),
                  addTableRow('Sopuse Name (If Applicable)',
                      Customer.spouseName.toUpperCase()),
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
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                  "Speciman Signature/Digital Signature (Where necessary) :"),
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: MemoryImage(imageCustomer.bytes),
                        fit: BoxFit.cover),
                    border: Border.all()),
              ),
            ]),
            SizedBox(height: 10),
            Container(
                alignment: Alignment.topLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("1. Has UNSCR's check done? (Yes) (No)"),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            "2. Has review of customer profile done (Existing customer)? If so, date of review .............."),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            "3. What is the average range of customer transaction (Over 6/12 months)? ........."),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            "4. Any other relevant field may be add here ....................................."),
                      )
                    ]))
          ]));
        }),
  );
  return pdf;
}

SizedBox tableRowDivider(double height) {
  return SizedBox(
    height: height,
  );
}

TableRow addTableRow (String option, String value) {
  return TableRow(
      children: [
        Container(
          height: 20,
          child: Row(
            children: [
            Text(option,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal)),
            ]
          )
        ),
        Container(
          height: 20,
          child: Text(': $value',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.normal)),
        ),
      ]);
}

// TableRow addTableRow(String option, String value) {
//   return TableRow(children: [
//     Text(option,
//         textAlign: TextAlign.left,
//         style: TextStyle(fontWeight: FontWeight.normal)),
//     Text(': $value',
//         textAlign: TextAlign.left,
//         style: TextStyle(fontWeight: FontWeight.normal)),
//   ]);
// }
