import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutterbascis/databasewithsqlflite/client_model.dart';
import 'package:flutterbascis/databasewithsqlflite/database_provider.dart';

void main() => runApp(MaterialApp(home: MyDatabaseApp()));

class MyDatabaseApp extends StatefulWidget {
  @override
  _MyDatabaseAppState createState() => _MyDatabaseAppState();
}

class _MyDatabaseAppState extends State<MyDatabaseApp> {
  // data for testing
  List<Client> testClients = [
    Client(firstName: "Raouf", lastName: "Rahiche", blocked: false, id: 1),
    Client(firstName: "Zaki", lastName: "oun", blocked: true, id: 2),
    Client(firstName: "oussama", lastName: "ali", blocked: false, id: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter SQLite")),
      body: FutureBuilder<List<Client>>(
        future: DBProvider.db.getAllClients(),
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                Client item = snapshot.data![index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    DBProvider.db.deleteClient(item.id);
                  },
                  child: ListTile(
                    title: Text(item.lastName),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
                      onChanged: (value) {
                        DBProvider.db.blockOrUnblock(item);
                        setState(() {});
                      },
                      value: item.blocked,
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          Client rnd = testClients[math.Random().nextInt(testClients.length)];
          await DBProvider.db.newClient(rnd);
          setState(() {});
        },
      ),
    );
  }
}
