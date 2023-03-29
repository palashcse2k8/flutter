import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/utilities/app_language.dart';
import 'package:flutterbascis/sblesheba/utilities/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_service_widget.dart';

class AllServicesPage extends StatelessWidget {
  const AllServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // color: Colors.cyan,
        // color: const Color(0xff0083a7),
        color: const Color.fromARGB(255, 1, 131, 167),
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
                      // debugPrint('clicked: $Constants.ACCOUNT_OPENING');
                      context.pushNamed(AppService.ACCOUNT_OPENING);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("ACCOUNT_OPENING") ?? "",
                        pathToImageIcon: Constants.addAccountIcon,
                        id: ServiceId.ACCCOUNT_OPPENING),
                  ),
                  GestureDetector(
                    onTap: () {
                      // debugPrint('clicked: $Constants.BUET_FEE');
                      context.pushNamed(AppService.BUET_FEE);
                      // context.push(AppService.BUET_FEE);
                      // Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) =>
                      //     const WebViewApp(url: 'https://sbl.com.bd:7070/BUET/Fee/')
                      // ));
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("BUET_FEE") ?? "",
                        pathToImageIcon: Constants.buetIcon,
                        id: ServiceId.BUET_FEE),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.XI_ADMISSION);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("XI_ADMISSION") ?? "",
                        pathToImageIcon: Constants.xiAdmissionIcon,
                        id: ServiceId.XI_ADMISSION),
                  ),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.CAHS_FEE);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("CAHS_FEE") ?? "",
                        pathToImageIcon: Constants.cashFeeIcon,
                        id: ServiceId.ACCCOUNT_OPPENING),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.BHBFC);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("BHBFC") ?? "",
                        pathToImageIcon: Constants.bhbfcIcon,
                        id: ServiceId.BUET_FEE),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.INCOME_TAX);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("INCOME_TAX") ?? "",
                        pathToImageIcon: Constants.incomeTaxIcon,
                        id: ServiceId.XI_ADMISSION),
                  ),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.TRAVEL_TAX);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("TRAVEL_TAX") ?? "",
                        pathToImageIcon: Constants.travelTaxIcno,
                        id: ServiceId.ACCCOUNT_OPPENING),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.REMIT_QUERY);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("REMIT_QUERY") ?? "",
                        pathToImageIcon: Constants.remitQueryIcon,
                        id: ServiceId.BUET_FEE),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.VAT_FEE);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("VAT_FEE") ?? "",
                        pathToImageIcon: Constants.vatFeeIcon,
                        id: ServiceId.XI_ADMISSION),
                  ),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.NATIONAL_UNIVERSITY_FEES);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("NATIONAL_UNIVERSITY_FEES") ?? "",
                        pathToImageIcon: Constants.nationUniversityFeeIcon,
                        id: ServiceId.ACCCOUNT_OPPENING),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.BOND_PAYMENT);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("BOND_PAYMENT") ?? "",
                        pathToImageIcon: Constants.bondPaymentIcon,
                        id: ServiceId.BUET_FEE),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.E_PASSPORT_FEE);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("E_PASSPORT_FEE") ?? "",
                        pathToImageIcon: Constants.ePassportIcon,
                        id: ServiceId.XI_ADMISSION),
                  ),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.KAMALAPUR_ICD);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("KAMALAPUR_ICD") ?? "",
                        pathToImageIcon: Constants.kamalapurIcdIcon,
                        id: ServiceId.ACCCOUNT_OPPENING),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.POLICE_CLEARANCE);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("POLICE_CLEARANCE") ?? "",
                        pathToImageIcon: Constants.policeClearanceIcon,
                        id: ServiceId.BUET_FEE),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.BUTEX);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("BUTEX") ?? "",
                        pathToImageIcon: Constants.butexIcon,
                        id: ServiceId.XI_ADMISSION),
                  ),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.JKKNU);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("JKKNU") ?? "",
                        pathToImageIcon: Constants.jkknuIcon,
                        id: ServiceId.ACCCOUNT_OPPENING),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.HSC_FEES);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("HSC_FEES") ?? "",
                        pathToImageIcon: Constants.hscFeesIcon,
                        id: ServiceId.BUET_FEE),
                  ),
                  GestureDetector(
                    onTap: () async {
                      // context.pushNamed(AppService.SONALI_E_WALLET);
                      String app_package_name = 'bd.com.sonalibank.sw';
                      LaunchApp.openApp(
                        androidPackageName: app_package_name,
                        iosUrlScheme: 'pulsesecure://',
                        appStoreLink:
                            'https://play.google.com/store/apps/details?id=bd.com.sonalibank.sw&hl=en&gl=US',
                      );
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("SONALI_E_WALLET") ?? "",
                        pathToImageIcon: Constants.sonaliEWalletIcon,
                        id: ServiceId.XI_ADMISSION),
                  ),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.SEVEN_COLLEGE_FEES);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("SEVEN_COLLEGE_FEES") ?? "",
                        pathToImageIcon: Constants.sevenCollegeicon,
                        id: ServiceId.ACCCOUNT_OPPENING),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.CUSTOMER_SERVICE_FORM);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("CUSTOMER_SERVICE_FORM") ?? "",
                        pathToImageIcon: Constants.customerServiceFormIcon,
                        id: ServiceId.BUET_FEE),
                  ),
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
                        label: AppLocalizations.of(context)?.translate("SUROKKHA") ?? "",
                        pathToImageIcon: Constants.surokkhaIcon,
                        id: ServiceId.XI_ADMISSION),
                  ),
                ],
              ),
              getRowDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.SOURCE_TAX_CERT);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("SOURCE_TAX_CERT") ?? "",
                        pathToImageIcon: Constants.sourceTaxCertIcon,
                        id: ServiceId.ACCCOUNT_OPPENING),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.DPDC);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("DPDC") ?? "",
                        pathToImageIcon: Constants.dpdcIcon,
                        id: ServiceId.BUET_FEE),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppService.BTCL);
                    },
                    child: CustomWidget(
                        label: AppLocalizations.of(context)?.translate("BTCL") ?? "",
                        pathToImageIcon: Constants.btclIcon,
                        id: ServiceId.XI_ADMISSION),
                  ),
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
