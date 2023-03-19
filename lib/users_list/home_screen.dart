
import 'package:flutter/material.dart';
import 'package:flutterbascis/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart/';

class UserListApp extends StatelessWidget{
  const UserListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => UserViewModel())
      ],
      child: MaterialApp(
        title: "MVVM",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }

}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

      ),
      body: Container(

      ),
    );
  }
}
