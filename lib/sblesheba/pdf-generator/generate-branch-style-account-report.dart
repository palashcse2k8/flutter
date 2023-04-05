import 'dart:core';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'image-converter.dart';
import 'model.dart';

DateTime dateTime = DateTime.now();
String openingDate = DateFormat.yMMMMd('en_US').format(dateTime);
String openingTime = DateFormat.jm().format(dateTime);
String openingDay = DateFormat('EEEE').format(dateTime);
double width = 0;

Future<Document> generateAccountInformationPdf() async {
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/icons/sonali-bank-banner.jpg'))
          .buffer
          .asUint8List());
  final imageCustomer = MemoryImage(
      (await rootBundle.load(Customer.imageLocation)).buffer.asUint8List());

  final pdf = Document();
  const pageTheme = PageTheme(
    pageFormat: PdfPageFormat.a4,
  );
  width = pageTheme.pageFormat.availableWidth;
  pdf.addPage(
    Page(
        pageFormat: PdfPageFormat.a4,
        build: (Context context) {
          return Container(
            child: Column(children: [
              // Stack(),
              getHeaderArea(imageLogo),
              getBranchInformation(),
              getAccountInformation(),
              SizedBox(height: 10),
              getPersonalDetails(),
              SizedBox(height: 10),
              getContactDetails()
            ]),
          );
        }),
  );
  return pdf;
}

Widget getPersonalDetails() {
  return Container(
    alignment: Alignment.topLeft,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Personal Details:",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      Table(border: TableBorder.all(width: 1), columnWidths: {
        0: const FixedColumnWidth(50),
        1: const FixedColumnWidth(100),
        2: const FixedColumnWidth(100),
        3: const FixedColumnWidth(100),
      }, children: [
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: PdfColors.black)),
          children: [
            Text(
              "Client No.",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Name",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Father's Name",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Mother's Name",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: PdfColors.black)),
          children: [
            Text("12345", textAlign: TextAlign.center),
            Text(Customer.name, textAlign: TextAlign.center),
            Text(Customer.fathersName, textAlign: TextAlign.center),
            Text(Customer.mothersName, textAlign: TextAlign.center),
          ],
        )
      ])
    ]),
  );
}

Widget getContactDetails() {
  return Container(
    alignment: Alignment.topLeft,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Contact Details:",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      Table(border: TableBorder.all(width: 1), columnWidths: {
        0: const FixedColumnWidth(100),
        1: const FixedColumnWidth(100),
        2: const FixedColumnWidth(100),
        3: const FixedColumnWidth(100),
      }, children: [
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: PdfColors.black)),
          children: [
            Text(
              "Present Address",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Permanent Address",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "Mobile/Telephone",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Email",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: PdfColors.black)),
          children: [
            Text(Customer.presentAddress, textAlign: TextAlign.center),
            Text(Customer.permanentAddress, textAlign: TextAlign.center),
            Align(
              alignment: Alignment.center,
              child: Text(Customer.mobileNumber, textAlign: TextAlign.center),
            ),
            Text(Customer.email, textAlign: TextAlign.center),
          ],
        )
      ])
    ]),
  );
}

Widget getAccountInformation() {
  return Container(
      alignment: Alignment.topLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Account Information:",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Table(
            tableWidth: TableWidth.min,
            border: const TableBorder(
                // left: BorderSide(color: PdfColors.black, width: 1),
                ),
            children: [
              addAccountInfoTableRow(
                  "1. Account Number ", Customer.accountNumber),
              addAccountInfoTableRow("2. Account Title ", Customer.name),
              addAccountInfoTableRow("3. Product Name ", "Savings Deposit"),
              addAccountInfoTableRow("4. Product Code ", "1000"),
            ])
      ]));
}

TableRow addAccountInfoTableRow(String option, String value) {
  return TableRow(children: [
    Container(
      height: 20,
      child: Text(option,
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.normal)),
    ),
    Container(
      height: 20,
      child: Text(': $value',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.normal)),
    ),
  ]);
}

Widget getBranchInformation() {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text("Sonali Bank Limited",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    Text("Branch Name",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal))
  ]);
}

Row getHeaderArea(MemoryImage imageLogo) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: 100,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: MemoryImage(imageLogo.bytes),
              ),
            ),
          ),
          Text("Generated By",
              style: const TextStyle(
                fontSize: 10,
              )),
          Text(
            "Information Technology Division (Business IT)",
          ),
          Text(
            "Head Office",
          ),
        ]),
    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Opening Date : $openingDate",
          ),
          Text(
            "Time : $openingTime , $openingDay",
          ),
        ]),
  ]);
}

SizedBox RowDivider(double height) {
  return SizedBox(
    height: height,
  );
}
