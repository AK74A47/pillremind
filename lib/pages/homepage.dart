
import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:pillremind/pages/add_precep.dart';
import 'package:pillremind/pages/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var db = DB();

  List<Map<String, String>> displayList = [];
  var user = '0736d42f-8dec-4586-a306-1068e5f82a0e';
  Future<void> _readPill() async {
    print("Connecting to mysql server...");

    // create connection
    final conn = await MySQLConnection.createConnection(
      host: "127.0.0.1", //when you use simulator
      port: 3306,
      userName: "root",
      password: "4065", // you need to replace with your password
      databaseName: "pillremind", // you need to replace with your db name
    );

    await conn.connect();

    print("Connected");

    // make query
    var result =
        await conn.execute("SELECT * FROM pill where pill.userId = '$user' ;");

    // print query result
    List<Map<String, String>> list = [];
    for (final row in result.rows) {
      final data = {
        'id': row.colAt(0)!,
        'name': row.colAt(1)!,
        'dose': row.colAt(2)!,
        'date': row.colAt(3)!,
        'gender': row.colAt(4)!,
      };
      list.add(data);
    }
    print('Query Success');

    setState(() {
      list;
      displayList = list;
    });

    // close all connections
    await conn.close();
  }

  var list = [];

  @override
  void initState() {
    _readPill();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ยาที่ต้องกิน'), actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            icon: const Icon(Icons.account_box))
      ]),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: displayList.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset('assets/images/pill.jpg'),
              ),
              title: Text(displayList[index]["name"]!),
              subtitle: Text(
                  '${displayList[index]["dose"]!} เม็ด \n${displayList[index]["date"]!}'),
              isThreeLine: true,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPrec(user: user),
              ));
        },
        tooltip: 'addPreception',
        child: const Icon(Icons.add),
      ),
    );
  }
}
