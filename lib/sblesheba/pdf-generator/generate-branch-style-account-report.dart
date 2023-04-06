import 'dart:core';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../datamodel/model.dart';

DateTime dateTime = DateTime.now();
String openingDate = DateFormat.yMMMMd('en_US').format(dateTime);
String openingTime = DateFormat.jm().format(dateTime);
String openingDay = DateFormat('EEEE').format(dateTime);
double width = 0;
double defaultFontSize = 10;

var ttf;

Future<Document> generateAccountInformationPdf() async {
  final font = await rootBundle.load("assets/fonts/OpenSans-Regular.ttf");
  ttf = Font.ttf(font);
  // var base64String = base64Decode("sd");
  // final base64Image = MemoryImage(base64String);

  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/icons/sonali-bank-banner.jpg'))
          .buffer
          .asUint8List());
  final imageCustomer = MemoryImage(
      (await rootBundle.load(Customer.customerImage)).buffer.asUint8List());
  final imageNominee = MemoryImage(
      (await rootBundle.load(Customer.nomineeImage)).buffer.asUint8List());
  final imageSignature = MemoryImage(
      (await rootBundle.load(Customer.customerSignature)).buffer.asUint8List());
  final imageNidFront = MemoryImage(
      (await rootBundle.load(Customer.customerNidFront)).buffer.asUint8List());
  final imageNidBack = MemoryImage(
      (await rootBundle.load(Customer.customerNidBack)).buffer.asUint8List());

  final pdf = Document();
  const pageTheme = PageTheme(
    pageFormat: PdfPageFormat.a4,
  );
  width = pageTheme.pageFormat.availableWidth;
  pdf.addPage(
    Page(
        pageFormat: PdfPageFormat.a4,
        margin: const EdgeInsets.only(top: 40, bottom: 50, left: 50, right: 50),
        build: (Context context) {
          return Container(
            child: Column(children: [
              // Stack(),
              getHeaderArea(imageLogo),
              getBranchInformation(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                getAccountInformation(),
                getCustomerNomineePhoto(imageCustomer, imageNominee),
              ]),
              // SizedBox(height: 10),
              getPersonalDetails(),
              SizedBox(height: 8),
              getContactDetails(),
              SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                getOtherDetails(),
                SizedBox(width: 10),
                getNidPhoto(imageNidFront, imageNidBack),
              ]),
              // SizedBox(height: 10),
              getNomineeDetails(),
              SizedBox(height: 8),
              getSignature(imageSignature),
              SizedBox(height: 8),
              getLowerPart()
            ]),
          );
        }),
  );
  return pdf;
}

Widget getCustomerNomineePhoto(
    MemoryImage imageCustomer, MemoryImage imageNominee) {
  return Container(
    child: Row(children: [
      getPhotoArea("Customer Photo", imageCustomer, 80, 100),
      SizedBox(width: 10),
      getPhotoArea("Nominee Photo", imageNominee, 80, 100),
    ]),
  );
}

Widget getNidPhoto(MemoryImage imageNidFront, MemoryImage imageNidBack) {
  return Container(
      child: Row(children: [
    Row(children: [
      getPhotoArea("Nid Front Side", imageNidFront, 120, 120),
      SizedBox(width: 10),
      getPhotoArea("Nid Back Side", imageNidBack, 120, 120),
      SizedBox(width: 10)
    ]),
  ]));
}

Widget getSignature(MemoryImage imageCustomer) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child:
              Text("Specimen Signature/Digital Signature (Where necessary) :"),
        ),
        SizedBox(height: 5),
        getPhotoArea("", imageCustomer, 60, 200),
      ]);
}

Widget getLowerPart() {
  return Container(
    child: Column(children: [
      Container(
        alignment: Alignment.topLeft,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCustomText(
                  "1. Has UNSCR's check done? (Yes) (No)", defaultFontSize),
              getCustomText(
                  "2. Has review of customer profile done (Existing customer)? If so, date of review ..............",
                  defaultFontSize),
              getCustomText(
                  "3. What is the average range of customer transaction (Over 6/12 months)? .........",
                  defaultFontSize),
              getCustomText(
                  "4. Any other relevant field may be add here .....................................",
                  defaultFontSize)
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
      SizedBox(height: 5),
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
            getCustomBoldText("Share (%)", defaultFontSize),
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

Widget getOtherDetails() {
  return Container(
    alignment: Alignment.topLeft,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Other Details:",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      SizedBox(height: 5),
      Table(
          tableWidth: TableWidth.min,
          border: const TableBorder(
              // left: BorderSide(color: PdfColors.black, width: 1),
              ),
          children: [
            addAccountInfoTableRow(
                "1. Nid/BRC ", Customer.nid, defaultFontSize),
            addAccountInfoTableRow(
                "2. Date of Birth ", Customer.dateOfBirth, defaultFontSize),
            addAccountInfoTableRow("3. TIN ", Customer.tin, defaultFontSize),
            addAccountInfoTableRow(
                "4. Gender (M/F/T)", Customer.gender, defaultFontSize),
            addAccountInfoTableRow(
                "5. Profession", Customer.profession, defaultFontSize),
            addAccountInfoTableRow("6. Spouse Name (If applicable)",
                Customer.spouseName, defaultFontSize),
          ])
    ]),
  );
}

Widget getCustomBoldText(String text, double defaultFontSize) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: defaultFontSize),
    ),
  );
}

Widget getCustomText(String text, double defaultFontSize) {
  return Padding(
    padding: const EdgeInsets.all(4),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style:
          TextStyle(fontWeight: FontWeight.normal, fontSize: defaultFontSize),
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
      SizedBox(height: 5),
      Table(border: TableBorder.all(width: 1), columnWidths: {
        0: const FixedColumnWidth(50),
        1: const FixedColumnWidth(100),
        2: const FixedColumnWidth(100),
        3: const FixedColumnWidth(100),
      }, children: [
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: PdfColors.black, style: BorderStyle.none)),
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
      SizedBox(height: 5),
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

Widget getPhotoArea(
    String photoTitle, MemoryImage image, double height, double width) {
  return Column(children: [
    Text(photoTitle, style: const TextStyle(fontSize: 10)),
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: PdfColors.black, style: BorderStyle.solid)),
      child: Image(MemoryImage(image.bytes), fit: BoxFit.cover),
    ),
  ]);
}

Widget getAccountInformation() {
  return Container(
      alignment: Alignment.topLeft,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Account Information:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Table(
              tableWidth: TableWidth.min,
              border: const TableBorder(
                  // left: BorderSide(color: PdfColors.black, width: 1),
                  ),
              children: [
                addAccountInfoTableRow("1. Account Number ",
                    Customer.accountNumber, defaultFontSize),
                addAccountInfoTableRow("2. Account Title ",
                    Customer.name.toUpperCase(), defaultFontSize),
                addAccountInfoTableRow(
                    "3. Product Name ", "Savings Deposit", defaultFontSize),
                addAccountInfoTableRow(
                    "4. Product Code ", "1000", defaultFontSize),
              ])
        ]),
      ]));
}

TableRow addAccountInfoTableRow(
    String option, String value, double defaultfontSize) {
  return TableRow(children: [
    Container(
      height: 20,
      child: Text(option,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: defaultfontSize,
          )),
    ),
    Container(
      height: 20,
      child: Text(': $value',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.normal,
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
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(height: 60, width: 100, MemoryImage(imageLogo.bytes)),
          SizedBox(height: 5),
          Text("Generated By",
              style: const TextStyle(
                fontSize: 8,
              )),
          Text("Information Technology Division",
              style: const TextStyle(fontSize: 10)),
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
