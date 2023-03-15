import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/utilities/constants.dart';

import 'custom_service_widget.dart';

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
              getUpperContent(),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: Constants.ACCCOUNT_OPPENING,
                      pathToIamgeIcon: Constants.addAccountIcon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: Constants.BUET_FEE,
                      pathToIamgeIcon: Constants.buetIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: Constants.XI_ADMISSION,
                      pathToIamgeIcon: Constants.xiAdmissionIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: Constants.CAHS_FEE,
                      pathToIamgeIcon: Constants.cashFeeIcon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: Constants.BHBFC,
                      pathToIamgeIcon: Constants.bhbfcIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: Constants.INCOME_TAX,
                      pathToIamgeIcon: Constants.incomeTaxIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: Constants.TRAVEL_TAX,
                      pathToIamgeIcon: Constants.travelTaxIcno,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: Constants.REMIT_QUERY,
                      pathToIamgeIcon: Constants.remitQueryIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: Constants.VAT_FEE,
                      pathToIamgeIcon: Constants.vatFeeIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: Constants.NATIONAL_UNIVERSITY_FEES,
                      pathToIamgeIcon: Constants.nationUniversityFeeIcon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: Constants.BOND_PAYMENT,
                      pathToIamgeIcon: Constants.bondPaymentIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: Constants.VAT_FEE,
                      pathToIamgeIcon: Constants.vatFeeIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: Constants.KAMALAPUR_ICD,
                      pathToIamgeIcon: Constants.kamalapurIcdIcon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: Constants.POLICE_CLEARANCE,
                      pathToIamgeIcon: Constants.policeClearanceIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: Constants.BUTEX,
                      pathToIamgeIcon: Constants.butexIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: Constants.JKKNU,
                      pathToIamgeIcon: Constants.jkknuIcon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: Constants.HSC_FEES,
                      pathToIamgeIcon: Constants.hscFeesIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: Constants.SONALI_E_WALLET,
                      pathToIamgeIcon: Constants.sonaliEWalletIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: Constants.SEVEN_COLLEGE_FEES,
                      pathToIamgeIcon: Constants.sevenCollegeicon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: Constants.CUSTOMER_SERVICE_FORM,
                      pathToIamgeIcon: Constants.customerServiceFormIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: Constants.SUROKKHA,
                      pathToIamgeIcon: Constants.surokkhaIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: Constants.SOURCE_TAX_CERT,
                      pathToIamgeIcon: Constants.sourceTaxCertIcon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: Constants.DPDC,
                      pathToIamgeIcon: Constants.dpdcIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: Constants.BTCL,
                      pathToIamgeIcon: Constants.btclIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getUpperContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Text(
              "Sonali eSheba",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              "Banking Services in Hand",
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
          ]),
          Expanded(
            child: Image.asset(
              Constants.sonaliBankLogo,
              height: 90,
              width: 90,
            ),
          ),
        ],
      ),
    );
  }
}

SizedBox getRowDivider() {
  double rowDividerSpace = 20;
  return SizedBox(height: rowDividerSpace);
}
