import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        // debugPrint("Live Chat Clicked");
        callDialApp();
      },
      tooltip: "Live Chat",
      child: CustomLiveChat(),
      // child: const Icon(Icons.add_call),
    );
  }
}

Future callDialApp() async {
  String url = "tel: +8809610016639";
  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalNonBrowserApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

Future callEmailApp() async {
  String url =
      "mailto:support@sonalibank.com.bd?subject=Support from eSheba&body=Dear Sir\n\n, Thanks ";
  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalNonBrowserApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

Widget CustomLiveChat() {
  return SpeedDial(
    // icon: Icons.add,
    // animatedIcon: AnimatedIcons.menu_close,
    // animatedIconTheme: const IconThemeData(size: 28.0),
    backgroundColor: Colors.white,
    visible: true,
    curve: Curves.bounceInOut,
    overlayOpacity: 0.5,
    overlayColor: Colors.black,
    spaceBetweenChildren: 10,
    spacing: 20,
    children: [
      SpeedDialChild(
        child: Image.asset(
          "assets/icons/call-icon.png",
          height: 30,
          width: 30,
        ),
        backgroundColor: Colors.white,
        onTap: () => callDialApp(),
        label: 'Call',
        labelStyle:
            const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        labelBackgroundColor: Colors.black,
      ),
      SpeedDialChild(
        child: Image.asset(
          "assets/icons/email-icon.png",
          height: 30,
          width: 30,
        ),
        backgroundColor: Colors.white,
        onTap: () => callEmailApp(),
        label: 'Email',
        labelStyle:
            const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        labelBackgroundColor: Colors.black,
      ),
      SpeedDialChild(
        child: Image.asset(
          "assets/icons/chat-icon.png",
          height: 30,
          width: 30,
        ),
        backgroundColor: Colors.white,
        onTap: () => debugPrint('Pressed Code'),
        label: 'Chat',
        labelStyle:
            const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        labelBackgroundColor: Colors.black,
      ),
    ],
    // icon: Icons.add,
    child: Image.asset(
      "assets/icons/call-icon.png",
    ),
  );
}
