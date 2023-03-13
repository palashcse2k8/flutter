import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/utilities/constants.dart';

class AllServicesPage extends StatefulWidget {
  const AllServicesPage({super.key});

  @override
  State<AllServicesPage> createState() => _AllServicesPageState();
}

class _AllServicesPageState extends State<AllServicesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: const [
                    Text(
                      "Sonali eSheba",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Banking Services in Hand",
                      style: TextStyle(fontSize: 10),
                    )
                  ]),
                  Image.asset(
                    Constants.sonaliBankLogo,
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getTileBoxItem(
                      Constants.ACCCOUNT_OPPENING, Constants.addAccountIcon),
                  getTileBoxItem(Constants.BUET_FEE, Constants.addAccountIcon),
                  getTileBoxItem(
                      Constants.XI_ADMISSION, Constants.addAccountIcon)
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getTileBoxItem(Constants.CAHS_FEE, Constants.addAccountIcon),
                  getTileBoxItem(Constants.BHBFC, Constants.addAccountIcon),
                  getTileBoxItem(Constants.INCOME_TAX, Constants.addAccountIcon)
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getTileBoxItem(
                      Constants.TRAVEL_TAX, Constants.addAccountIcon),
                  getTileBoxItem(
                      Constants.REMIT_QUERY, Constants.addAccountIcon),
                  getTileBoxItem(Constants.VAT_FEE, Constants.addAccountIcon)
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getTileBoxItem(Constants.NATIONAL_UNIVERSITY_FEES,
                      Constants.addAccountIcon),
                  getTileBoxItem(
                      Constants.BOND_PAYMENT, Constants.addAccountIcon),
                  getTileBoxItem(
                      Constants.E_PASSPORT_FEE, Constants.addAccountIcon)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

SizedBox getRowDivider() {
  double rowDividerSpace = 20;
  return SizedBox(height: rowDividerSpace);
}

Container getTileBoxItem(String lebel, String pathToIamgeIcon) {
  return Container(
    // color: Colors.blueGrey,
    decoration: BoxDecoration(
        color: Colors.blueGrey,
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    width: 120,
    height: 120,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            pathToIamgeIcon,
            height: 40,
            width: 40,
          ),
          const SizedBox(height: 15),
          Text(
            lebel,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.white,
          )
        ],
      ),
    ),
  );
}
