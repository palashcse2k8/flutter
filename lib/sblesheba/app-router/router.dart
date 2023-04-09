import 'package:flutterbascis/sblesheba/presentation/pages/account_openning/account-opening-page1.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/error_page/error_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/esheba_home_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/web_view_services.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/user_manual_pages/pdf_viewer_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/user_manual_pages/user_manual_home_pages.dart';
import 'package:flutterbascis/sblesheba/provider/navigation_provider.dart';
import 'package:flutterbascis/sblesheba/utilities/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RouterConfiguration {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'home',
        // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/',
        builder: (context, state) => const EshebaHomePage(),
      ),
      GoRoute(
        name: 'user-manual-page',
        // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/user-manual-page',
        builder: (context, state) => const UserManualHomePage(),
      ),
      GoRoute(
        name: 'user-manual-page-with-pdf',
        // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/user-manual-page-with-pdf',
        builder: (context, state) {
          final provider =
              Provider.of<AppNavigationProvider>(context, listen: false);
          return PDFScreen(assetPath: provider.pdfPath);
        },
      ),
      GoRoute(
        name: AppService.ACCOUNT_OPENING,
        path: '/account-opening-page',
        // builder: (context, state) => const AccountOpeningPage(
        //   setupPageRoute: '/account-opening-page',
        // ),
        builder: (context, state) => const AccountOpeningPage1(),
      ),
      GoRoute(
        name: AppService.BUET_FEE,
        path: '/buet-fee',
        builder: (context, state) => WebViewApp(url: ServiceURL.BUET_FEE),
      ),
      GoRoute(
        name: AppService.XI_ADMISSION,
        path: '/xi-admission',
        builder: (context, state) => WebViewApp(url: ServiceURL.XI_ADMISSION),
      ),
      GoRoute(
        name: AppService.CAHS_FEE,
        path: '/cahs-fee',
        builder: (context, state) => WebViewApp(url: ServiceURL.CAHS_FEE),
      ),
      GoRoute(
        name: AppService.BHBFC,
        path: '/bhbfc',
        builder: (context, state) => WebViewApp(url: ServiceURL.BHBFC),
      ),
      GoRoute(
        name: AppService.INCOME_TAX,
        path: '/income-tax',
        builder: (context, state) => WebViewApp(url: ServiceURL.INCOME_TAX),
      ),
      GoRoute(
        name: AppService.TRAVEL_TAX,
        path: '/travel-tax',
        builder: (context, state) => WebViewApp(url: ServiceURL.TRAVEL_TAX),
      ),
      GoRoute(
        name: AppService.REMIT_QUERY,
        path: '/remit-query',
        builder: (context, state) => WebViewApp(url: ServiceURL.REMIT_QUERY),
      ),
      GoRoute(
        name: AppService.VAT_FEE,
        path: '/vat-fee',
        builder: (context, state) => WebViewApp(url: ServiceURL.VAT_FEE),
      ),
      GoRoute(
        name: AppService.NATIONAL_UNIVERSITY_FEES,
        path: '/national-university-fee',
        builder: (context, state) =>
            WebViewApp(url: ServiceURL.NATIONAL_UNIVERSITY_FEES),
      ),
      GoRoute(
        name: AppService.BOND_PAYMENT,
        path: '/bond-payment',
        builder: (context, state) => WebViewApp(url: ServiceURL.BOND_PAYMENT),
      ),
      GoRoute(
        name: AppService.E_PASSPORT_FEE,
        path: '/e-passport-fee',
        builder: (context, state) => WebViewApp(url: ServiceURL.E_PASSPORT_FEE),
      ),
      GoRoute(
        name: AppService.KAMALAPUR_ICD,
        path: '/kamalapur-icd',
        builder: (context, state) => WebViewApp(url: ServiceURL.KAMALAPUR_ICD),
      ),
      GoRoute(
        name: AppService.POLICE_CLEARANCE,
        path: '/police-clearance',
        builder: (context, state) =>
            WebViewApp(url: ServiceURL.POLICE_CLEARANCE),
      ),
      GoRoute(
        name: AppService.BUTEX,
        path: '/butex-fee',
        builder: (context, state) => WebViewApp(url: ServiceURL.BUTEX),
      ),
      GoRoute(
        name: AppService.JKKNU,
        path: '/jatio-kobi-kaji-najrul-islam-university',
        builder: (context, state) => WebViewApp(url: ServiceURL.JKKNU),
      ),
      GoRoute(
        name: AppService.HSC_FEES,
        path: '/hsc-fee',
        builder: (context, state) => WebViewApp(url: ServiceURL.HSC_FEES),
      ),
      GoRoute(
        name: AppService.SONALI_E_WALLET,
        path: '/sonali-e-wallet',
        builder: (context, state) =>
            WebViewApp(url: ServiceURL.SONALI_E_WALLET),
      ),
      GoRoute(
        name: AppService.SEVEN_COLLEGE_FEES,
        path: '/seven-college-fees',
        builder: (context, state) =>
            WebViewApp(url: ServiceURL.SEVEN_COLLEGE_FEES),
      ),
      GoRoute(
        name: AppService.CUSTOMER_SERVICE_FORM,
        path: '/customer-service-form',
        builder: (context, state) =>
            WebViewApp(url: ServiceURL.CUSTOMER_SERVICE_FORM),
      ),
      GoRoute(
        name: AppService.SUROKKHA,
        path: '/surokkha',
        builder: (context, state) => WebViewApp(url: ServiceURL.SUROKKHA),
      ),
      GoRoute(
        name: AppService.SOURCE_TAX_CERT,
        path: '/source-tax-cert',
        builder: (context, state) =>
            WebViewApp(url: ServiceURL.SOURCE_TAX_CERT),
      ),
      GoRoute(
        name: AppService.DPDC,
        path: '/dpdc',
        builder: (context, state) => WebViewApp(url: ServiceURL.DPDC),
      ),
      GoRoute(
        // name: AppService.BTCL,
        path: '/btcl',
        builder: (context, state) => WebViewApp(url: ServiceURL.BTCL),
      )
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
    // errorPageBuilder: (context, state) => MaterialPage(
    //   key: state.pageKey,
    //   child: Scaffold(
    //     appBar: AppBar(
    //         centerTitle: true,
    //         title: const Text(
    //             "Coming Soon....!"
    //         )
    //     ),
    //     body:  const Center(
    //       child: Text(
    //         "Nothing to show. Coming Soon.....!",
    //         style: TextStyle(
    //             fontSize: 20
    //         ),
    //       ),
    //     ),
    //   ),
    // ),
    redirect: (context, state) {
      late bool isAuthenticated =
          true; // Add your logic to check whether a user is authenticated or not
      if (!isAuthenticated) {
        return '/auth';
      } else {
        return null;
      }
    },
  );
}
