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
double defaultFontSize = 10;

Future<Document> generateAccountInformationPdf() async {
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/icons/sonali-bank-banner.jpg'))
          .buffer
          .asUint8List());
  final imageCustomer = MemoryImage((await rootBundle.load(Customer.imageLocation)).buffer.asUint8List());
  final imageSignture = MemoryImage((await rootBundle.load(Customer.imageSignature)).buffer.asUint8List());

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
              getAccountInformation(imageCustomer),
              // SizedBox(height: 10),
              getPersonalDetails(),
              SizedBox(height: 5),
              getContactDetails(),
              SizedBox(height: 5),
              getOtherDetails(imageCustomer),
              // SizedBox(height: 10),
              getNomineeDetails(),
              SizedBox(height: 5),
              getSignature(imageSignture),
              SizedBox(height: 5),
              getLowerPart()
            ]),
          );
        }),
  );
  return pdf;
}

Widget getSignature(MemoryImage imageCustomer) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Align(
      alignment: Alignment.topLeft,
      child: Text("Speciman Signature/Digital Signature (Where necessary) :"),
    ),
    SizedBox(height: 10),
    Container(
      height: 60,
      width: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: MemoryImage(imageCustomer.bytes), fit: BoxFit.cover),
          border: Border.all()),
    ),
  ]);
}

Widget getLowerPart() {
  return Container(
    child: Column(children: [
      Container(
        alignment: Alignment.topLeft,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("1. Has UNSCR's check done? (Yes) (No)"),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
                "2. Has review of customer profile done (Existing customer)? If so, date of review .............."),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
                "3. What is the average range of customer transaction (Over 6/12 months)? ........."),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
                "4. Any other relevant field may be add here ....................................."),
          ),
        ]),
      ),
    ]),
  );
}

Widget getNomineeDetails() {
  return Container(
    alignment: Alignment.topLeft,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Nominee Details:",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      Table(border: TableBorder.all(width: 1), columnWidths: {
        0: const FixedColumnWidth(50),
        1: const FixedColumnWidth(100),
        2: const FixedColumnWidth(60),
        3: const FixedColumnWidth(80),
        4: const FixedColumnWidth(100),
        5: const FixedColumnWidth(60),
      }, children: [
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: PdfColors.black)),
          children: [

            getCustomBoldText("Sl.", defaultFontSize),
            getCustomBoldText("Nominee Name", defaultFontSize),
            getCustomBoldText("Share %", defaultFontSize),
            getCustomBoldText("Date Of Birth", defaultFontSize),
            getCustomBoldText("NID/BRC", defaultFontSize),
            getCustomBoldText("Relation", defaultFontSize),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: PdfColors.black)),
          children: [
            getCustomText("1.", defaultFontSize),
            getCustomText(Customer.nomineeName, defaultFontSize),
            getCustomText(Customer.nomineeShare, defaultFontSize),
            getCustomText(Customer.nomineeDateofBirth, defaultFontSize),
            getCustomText(Customer.nomineeNidBRC, defaultFontSize),
            getCustomText(Customer.nomineeRelation, defaultFontSize),
          ],
        )
      ])
    ]),
  );
}

Widget getOtherDetails(MemoryImage image) {
  return Container(
      alignment: Alignment.topLeft,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Other Details:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Table(
                tableWidth: TableWidth.min,
                border: const TableBorder(
                  // left: BorderSide(color: PdfColors.black, width: 1),
                ),
                children: [
                  addAccountInfoTableRow("1. Nid/BRC ", Customer.nid, defaultFontSize),
                  addAccountInfoTableRow("2. Date of Birth ", Customer.dateOfBirth, defaultFontSize),
                  addAccountInfoTableRow("3. TIN ", Customer.tin, defaultFontSize),
                  addAccountInfoTableRow("4.  Gender (M/F/T)", Customer.gender, defaultFontSize),
                  addAccountInfoTableRow("5.  Profession", Customer.profession, defaultFontSize),
                  addAccountInfoTableRow(
                      "6. Sopuse Name (If Applicable) ", Customer.spouseName, defaultFontSize),
                ])
          ]),
          Container(
              child: Row(
                children: [
                  Column(
                      children: [
                        Text("Nominee Photo", style: const TextStyle(fontSize: 10)),
                        Container(
                            height: 80,
                            width: 150,
                            child: Image(MemoryImage(image.bytes))
                        ),
                        SizedBox(width: 10)
                      ]
                  ),
                  SizedBox(width: 30)
                ]
              )
          )
        ]
      )
  );
}

Widget getCustomBoldText(String text, double defaultFontSize ) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: defaultFontSize),
    ),
  );
}

Widget getCustomText(String text, double defaultFontSize ) {
  return Padding(
    padding: EdgeInsets.all(4),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.normal, fontSize: defaultFontSize),
    ),
  );
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
              border: Border.all(width: 1, color: PdfColors.black, style: BorderStyle.none)),
          children: [
            getCustomBoldText("Client No.", defaultFontSize),
            getCustomBoldText("Name", defaultFontSize),
            getCustomBoldText("Father's Name", defaultFontSize),
            getCustomBoldText("Mother's Name", defaultFontSize),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: PdfColors.black)),
          children: [
            getCustomText("12345", defaultFontSize),
            getCustomText(Customer.name.toUpperCase(), defaultFontSize),
            getCustomText(Customer.fathersName.toUpperCase(), defaultFontSize),
            getCustomText(Customer.mothersName.toUpperCase(), defaultFontSize),
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
        2: const FixedColumnWidth(80),
        3: const FixedColumnWidth(120),
      }, children: [
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: PdfColors.black)),
          children: [
            getCustomBoldText("Present Address", defaultFontSize),
            getCustomBoldText("Permanent Address", defaultFontSize),
            getCustomBoldText("Mobile", defaultFontSize),
            getCustomBoldText("Email", defaultFontSize),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: PdfColors.black)),
          children: [
            getCustomText(Customer.presentAddress, defaultFontSize),
            getCustomText(Customer.permanentAddress, defaultFontSize),
            getCustomText(Customer.mobileNumber, defaultFontSize),
            getCustomText(Customer.email, defaultFontSize),
          ],
        )
      ])
    ]),
  );
}

Widget getAccountInformation(MemoryImage image) {
  return Container(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Account Information:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Table(
                tableWidth: TableWidth.min,
                border: const TableBorder(
                  // left: BorderSide(color: PdfColors.black, width: 1),
                ),
                children: [
                  addAccountInfoTableRow("1. Account Number ", Customer.accountNumber, defaultFontSize),
                  addAccountInfoTableRow("2. Account Title ", Customer.name.toUpperCase(), defaultFontSize),
                  addAccountInfoTableRow("3. Product Name ", "Savings Deposit", defaultFontSize),
                  addAccountInfoTableRow("4. Product Code ", "1000", defaultFontSize),
                ])
          ]),
          Container(
            child:
            Row(
              children: [
                Column(
                    children: [
                      Text("Customer Photo", style: TextStyle(fontSize: 10)),
                      Container(
                          height: 80,
                          width: 150,
                          child: Image(MemoryImage(image.bytes))
                      ),
                      SizedBox(width: 10)
                    ]
                ),
                SizedBox(width: 30)
              ]
            )
          )
        ]
      )

  );
}

TableRow addAccountInfoTableRow(String option, String value, double defaultfontSize) {
  return TableRow(children: [
    Container(
      height: 20,
      child: Text(option,
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.normal,
            fontSize: defaultfontSize,
          )),
    ),
    Container(
      height: 20,
      child: Text(': $value',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.normal,
            fontSize: defaultfontSize,
          )),
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
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
                fontSize: 8,
              )),
          Text(
            "Information Technology Division",
            style: const TextStyle(fontSize: 10)
          ),
          // Text(
          //   "Head Office",
          //     style: const TextStyle(fontSize: 10)
          // ),
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
