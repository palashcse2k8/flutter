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
double defaultHeaderFontSize = 14;
double paddingSize = 2;

var customFont;
var customFontBold;

Future getFont() async {
  // customFont = await PdfGoogleFonts.abhayaLibreRegular();
  customFont =
      Font.ttf(await rootBundle.load("assets/fonts/OpenSans-Regular.ttf"));
  customFontBold =
      Font.ttf(await rootBundle.load("assets/fonts/OpenSans-Bold.ttf"));
}

Future<Document> generateAccountInformationPdf() async {
  await getFont();

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
                Expanded(child: getAccountInformation()),
                getCustomerNomineePhoto(imageCustomer, imageNominee),
              ]),
              // SizedBox(height: 10),
              getPersonalDetails(),
              SizedBox(height: 8),
              getContactDetails(),
              SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(child: getOtherDetails()),
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
      getPhotoArea("Nid Back Side", null, 120, 120),
    ]),
  ]));
}

Widget getSignature(MemoryImage imageCustomer) {
  return Align(
      alignment: Alignment.topLeft,
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCustomText(
                "Specimen Signature/Digital Signature (Where necessary) :",
                defaultFontSize,
                TextAlign.left),
            SizedBox(height: 5),
            getPhotoArea("", imageCustomer, 60, 200),
          ]));
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
              getCustomText("1. Has UNSCR's check done? (Yes) (No)",
                  defaultFontSize, TextAlign.left),
              getCustomText(
                  "2. Has review of customer profile done (Existing customer)? If so, date of review ..............",
                  defaultFontSize,
                  TextAlign.left),
              getCustomText(
                  "3. What is the average range of customer transaction (Over 6/12 months)? .........",
                  defaultFontSize,
                  TextAlign.left),
              getCustomText(
                  "4. Any other relevant field may be add here .....................................",
                  defaultFontSize,
                  TextAlign.left)
            ]),
      ),
    ]),
  );
}

Widget getNomineeDetails() {
  return Container(
    alignment: Alignment.topLeft,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      getCustomBoldText("Nominee Details:", defaultHeaderFontSize),
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
            getPaddedText("Sl.", defaultFontSize),
            getPaddedText("Nominee Name", defaultFontSize),
            getPaddedText("Share (%)", defaultFontSize),
            getPaddedText("Date Of Birth", defaultFontSize),
            getPaddedText("NID/BRC", defaultFontSize),
            getPaddedText("Relation", defaultFontSize),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: PdfColors.black)),
          children: [
            getPaddedText("1.", defaultFontSize),
            getPaddedText(Customer.nomineeName, defaultFontSize),
            getPaddedText(Customer.nomineeShare, defaultFontSize),
            getPaddedText(Customer.nomineeDateofBirth, defaultFontSize),
            getPaddedText(Customer.nomineeNidBRC, defaultFontSize),
            getPaddedText(Customer.nomineeRelation, defaultFontSize),
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
      getCustomBoldText("Other Details:", defaultHeaderFontSize),
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
            addAccountInfoTableRow("6. Spouse Name (If Any)",
                Customer.spouseName, defaultFontSize),
          ])
    ]),
  );
}

Widget getPaddedText(String text, double defaultFontSize) {
  return Padding(
      padding: const EdgeInsets.all(4),
      child: getCustomText(text, defaultFontSize, TextAlign.center));
}

Widget getCustomBoldText(String text, double defaultFontSize) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: TextStyle(
        font: customFontBold,
        fontWeight: FontWeight.bold,
        fontSize: defaultFontSize),
  );
}

Widget getCustomText(
    String text, double defaultFontSize, TextAlign? textAlign) {
  return Text(
    text,
    textAlign: (textAlign != null) ? textAlign : TextAlign.left,
    style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: defaultFontSize,
        font: customFont),
  );
}

Widget getPersonalDetails() {
  return Container(
    alignment: Alignment.topLeft,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      getCustomBoldText("Personal Details:", defaultHeaderFontSize),
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
            getPaddedText("Client No.", defaultFontSize),
            getPaddedText("Name", defaultFontSize),
            getPaddedText("Father's Name", defaultFontSize),
            getPaddedText("Mother's Name", defaultFontSize),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: PdfColors.black)),
          children: [
            getPaddedText("12345", defaultFontSize),
            getPaddedText(Customer.name.toUpperCase(), defaultFontSize),
            getPaddedText(Customer.fathersName.toUpperCase(), defaultFontSize),
            getPaddedText(Customer.mothersName.toUpperCase(), defaultFontSize),
          ],
        )
      ])
    ]),
  );
}

Widget getContactDetails() {
  return Container(
    alignment: Alignment.topLeft,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCustomBoldText("Contact Details:", defaultHeaderFontSize),
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
                getPaddedText("Present Address", defaultFontSize),
                getPaddedText("Permanent Address", defaultFontSize),
                getPaddedText("Mobile", defaultFontSize),
                getPaddedText("Email", defaultFontSize),
              ],
            ),
            TableRow(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: PdfColors.black)),
              children: [
                getPaddedText(Customer.presentAddress, defaultFontSize),
                getPaddedText(Customer.permanentAddress, defaultFontSize),
                getPaddedText(Customer.mobileNumber, defaultFontSize),
                getPaddedText(Customer.email, defaultFontSize),
              ],
            )
          ])
        ]),
  );
}

Widget getPhotoArea(
    String photoTitle, MemoryImage? image, double height, double width) {
  return Column(children: [
    getCustomText(photoTitle, defaultFontSize, TextAlign.left),
    Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: PdfColors.black, style: BorderStyle.solid)),
        child: (image != null)
            ? Image(MemoryImage(image.bytes), fit: BoxFit.cover)
            : Center(
                child:
                    getCustomText("No Photo", defaultFontSize, TextAlign.left),
              )),
  ]);
}

Widget getAccountInformation() {
  return Container(
      alignment: Alignment.topLeft,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          getCustomBoldText("Account Information:", 14),
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
    String option, String value, double defaultFontSize) {
  return TableRow(children: [
    Container(
      height: 15,
      child: getCustomText(option, defaultFontSize, TextAlign.left),
    ),
    Container(
      height: 15,
      child: getCustomText(' : $value', defaultFontSize, TextAlign.left),
    ),
  ]);
}

Widget getBranchInformation() {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    getCustomBoldText("Sonali Bank Limited", 14),
    getCustomText("Branch Name", 14, TextAlign.left)
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
          getCustomText("Generated By", 8, TextAlign.left),
          getCustomText("Information Technology Division", 10, TextAlign.left)
        ]),
    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCustomText(
              "Opening Date : $openingDate", defaultFontSize, TextAlign.left),
          getCustomText("Time : $openingTime , $openingDay", defaultFontSize,
              TextAlign.left)
        ]),
  ]);
}

SizedBox rowDivider(double height) {
  return SizedBox(
    height: height,
  );
}
