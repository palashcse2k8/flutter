import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/utilities/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        // color: Colors.cyan,
        color: const Color(0xff0083a7),
        // color: Color(0xffe27639),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              getUpperContent(),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      debugPrint('clicked: $Constants.ACCCOUNT_OPPENING');
                      context.pushNamed(AppService.ACCCOUNT_OPPENING);
                      // Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) =>
                      //   const AccountOpeningPage()
                      // ));
                    },
                    child: CustomWidget(
                        lebel: AppService.ACCCOUNT_OPPENING,
                        pathToIamgeIcon: Constants.addAccountIcon,
                        id: ServiceId.ACCCOUNT_OPPENING),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('clicked: $Constants.BUET_FEE');
                      context.pushNamed(AppService.BUET_FEE);
                      // context.push(AppService.BUET_FEE);
                      // Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) =>
                      //     const WebViewApp(url: 'https://sbl.com.bd:7070/BUET/Fee/')
                      // ));
                    },
                    child: CustomWidget(
                        lebel: AppService.BUET_FEE,
                        pathToIamgeIcon: Constants.buetIcon,
                        id: ServiceId.BUET_FEE),
                  ),
                  CustomWidget(
                      lebel: AppService.XI_ADMISSION,
                      pathToIamgeIcon: Constants.xiAdmissionIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: AppService.CAHS_FEE,
                      pathToIamgeIcon: Constants.cashFeeIcon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: AppService.BHBFC,
                      pathToIamgeIcon: Constants.bhbfcIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: AppService.INCOME_TAX,
                      pathToIamgeIcon: Constants.incomeTaxIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: AppService.TRAVEL_TAX,
                      pathToIamgeIcon: Constants.travelTaxIcno,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: AppService.REMIT_QUERY,
                      pathToIamgeIcon: Constants.remitQueryIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: AppService.VAT_FEE,
                      pathToIamgeIcon: Constants.vatFeeIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: AppService.NATIONAL_UNIVERSITY_FEES,
                      pathToIamgeIcon: Constants.nationUniversityFeeIcon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: AppService.BOND_PAYMENT,
                      pathToIamgeIcon: Constants.bondPaymentIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: AppService.VAT_FEE,
                      pathToIamgeIcon: Constants.vatFeeIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: AppService.KAMALAPUR_ICD,
                      pathToIamgeIcon: Constants.kamalapurIcdIcon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: AppService.POLICE_CLEARANCE,
                      pathToIamgeIcon: Constants.policeClearanceIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: AppService.BUTEX,
                      pathToIamgeIcon: Constants.butexIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: AppService.JKKNU,
                      pathToIamgeIcon: Constants.jkknuIcon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: AppService.HSC_FEES,
                      pathToIamgeIcon: Constants.hscFeesIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: AppService.SONALI_E_WALLET,
                      pathToIamgeIcon: Constants.sonaliEWalletIcon,
                      id: ServiceId.XI_ADMISSION),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: AppService.SEVEN_COLLEGE_FEES,
                      pathToIamgeIcon: Constants.sevenCollegeicon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: AppService.CUSTOMER_SERVICE_FORM,
                      pathToIamgeIcon: Constants.customerServiceFormIcon,
                      id: ServiceId.BUET_FEE),
                  GestureDetector(
                    onTap: () async {
                      String url = ServiceURL.SUROKKHA;
                      if (!await launchUrl(
                        Uri.parse(url),
                        mode: LaunchMode.externalApplication,
                      )) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: CustomWidget(
                        lebel: AppService.SUROKKHA,
                        pathToIamgeIcon: Constants.surokkhaIcon,
                        id: ServiceId.XI_ADMISSION),
                  ),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      lebel: AppService.SOURCE_TAX_CERT,
                      pathToIamgeIcon: Constants.sourceTaxCertIcon,
                      id: ServiceId.ACCCOUNT_OPPENING),
                  CustomWidget(
                      lebel: AppService.DPDC,
                      pathToIamgeIcon: Constants.dpdcIcon,
                      id: ServiceId.BUET_FEE),
                  CustomWidget(
                      lebel: AppService.BTCL,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Sonali eSheba",
                      textAlign: TextAlign.left,
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
            ),
          ),
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
