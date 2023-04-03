import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:printing/printing.dart';

import 'model.dart';

class AccountInformation extends StatelessWidget {
  AccountInformation({Key? key}) : super(key: key);

  // late final imageLogo;
  //
  // createLogo() async {
  //   imageLogo = MemoryImage(
  //       (await rootBundle.load(Customer.imageLocation)).buffer.asUint8List());
  // }

  @override
  Widget build(BuildContext context) {
    final font = PdfGoogleFonts.nunitoExtraLight();
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              width: 200,
              height: 40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage(Customer.imageLocation)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 70,
                decoration: const BoxDecoration(shape: BoxShape.rectangle),
                child: const Placeholder(),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 80,
                height: 70,
                decoration: const BoxDecoration(shape: BoxShape.rectangle),
                child: const Placeholder(),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(
              "Name of the branch: ${Customer.nameOfBranch}",
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 10,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(width: 5,),
            Text(
              "Account Number: ${Customer.accountNumber}",
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              width: double.infinity,
              // height: 100,
              margin: const EdgeInsets.all(10),
              child: Table(
                border: TableBorder.all(),
                children: const [
                  TableRow(children: [
                    Text('Sport', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Total Players', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                  ]),
                  TableRow(children: [
                    Text('Soccer', textAlign: TextAlign.center),
                    Text('11', textAlign: TextAlign.center),
                  ]),
                ],
              ),
            ),
            // Text("Account No: ${Customer.accountNumber}"),
          ])
        ]),
      ),
    );
  }
}
