// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:http/http.dart' as http;
//
// class MyLearningHomePage extends StatefulWidget {
//   const MyLearningHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyLearningHomePage> createState() => _MyLearningHomePageState();
// }
//
// class _MyLearningHomePageState extends State<MyLearningHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   void _dencrementCounter() {
//     setState(() {
//       _counter--;
//     });
//   }
//
//   final List<String> entries = <String>['A', 'B', 'C', 'D', 'E'];
//   final List<int> colorCodes = <int>[600, 500, 100, 50, 20];
//   String? myImage;
//   String? myName;
//
//
//   late StreamSubscription subscription;
//
//   @override
//   initState() async {
//     super.initState();
//     subscription = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) {
//       debugPrint(result.name);
//     });
//   }
//
//   @override
//   dispose() {
//     subscription.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         initialIndex: 1,
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('widget.title : $_counter'),
//             bottom: TabBar(
//               // controller: _tabController,
//               tabs: <Widget>[
//                 Tab(
//                   icon: Icon(Icons.cloud_outlined),
//                 ),
//                 Tab(
//                   icon: Icon(Icons.beach_access_sharp),
//                 ),
//                 Tab(
//                   icon: Icon(Icons.brightness_5_sharp),
//                 ),
//               ],
//             ),
//           ),
//
//           drawer: Drawer(
//             child: ListView(
//               children: [
//                 DrawerHeader(
//                     decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                     child: const Center(
//                       child: Text("This is header"),
//                     )),
//                 getDrawerItem("Menu 1", Icons.add),
//                 getDrawerItem("Menu 2", Icons.add),
//                 getDrawerItem("Menu 3", Icons.add),
//                 getDrawerItem("Menu 4", Icons.add),
//               ],
//             ),
//           ),
//           body: TabBarView(
//             // controller: _tabController,
//             children: <Widget>[
//               const Center(
//                 child: Text("It's cloudy here"),
//               ),
//               Tab1View(image: "myImage", txt: "myName",),
//               const Center(
//                 child: Text("It's sunny here"),
//               ),
//             ],
//           ),
//
//           // Center(
//           //   child: TextButton (
//           //     onPressed: () {
//           //       _showMyDialog();
//           //     },
//           //     child: const Text("Show Dialogue"),
//           //
//           //   ),
//           // ),
//
//           floatingActionButton: FloatingActionButton(
//             onPressed: () async {
//               final connectivityResult =
//                   await (Connectivity().checkConnectivity());
//               if (connectivityResult == ConnectivityResult.mobile) {
//                 debugPrint("Mobile Connected");
//               } else if (connectivityResult == ConnectivityResult.wifi) {
//                 debugPrint("Wifi Connected");
//                 // var url = Uri.https('https://reqres.in/api/users/2', 'whatsit/create');
//               }
//             },
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ), // This trailing comma makes auto-formatting nicer for build methods.
//         ));
//   }
//
//   Widget getDrawerItem(String txt, IconData icon) {
//     return Container(
//       color: Colors.orange,
//       child: Column(
//         children: [
//           Row(children: [
//             Text(txt),
//             const Spacer(),
//             Icon(icon),
//           ]),
//           const Divider(
//             color: Colors.white,
//             thickness: 2,
//           )
//         ],
//       ),
//     );
//   }
//
//   Future<void> _showMyDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: const <Widget>[
//                 Text('This is a demo alert dialog.'),
//                 Text('Would you like to approve of this message?'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Increment'),
//               onPressed: () {
//                 _incrementCounter();
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Decrement'),
//               onPressed: () {
//                 _dencrementCounter();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class Tab1View extends StatefulWidget {
//   final String? image;
//   final String? txt;
//
//   const Tab1View({Key? key , required this.image, required this.txt}) : super(key: key);
//
//   @override
//   State<Tab1View> createState() => _Tab1ViewState();
// }
//
// class _Tab1ViewState extends State<Tab1View> {
//
//   var response =
//       await http.get(Uri.parse("https://reqres.in/api/users/2"));
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
//   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
//   Map extdata = decodedResponse['data'];
//   myImage = extdata['avatar'];
//   myName = extdata['avatar'];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//
//       child: Center(child: Column(
//         children: [
//           widget.image != null ?
//           Image.network(
//             widget.image!,
//             width: 200,
//             height: 200,
//           ) : Container(),
//           Text(widget.txt ?? ""),
//         ],
//       )),
//     );
//   }
// }
