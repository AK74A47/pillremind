import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';

import 'homepage.dart';

class AddPrec extends StatefulWidget {
  const AddPrec({super.key, this.user});

  final user;

  @override
  State<AddPrec> createState() => _AddPrecState();
}

class _AddPrecState extends State<AddPrec> {
  TextEditingController nameController = TextEditingController();
  TextEditingController doseController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Future<void> _insert() async {
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

    // insert some rows
    var res = await conn.execute(
      "INSERT INTO `pill` (`id`, `name`, `dose`, `time`, `userId`) VALUES (:id, :name, :dose, :time, :user);",
      {
        "id": null, //if you set it auto increment
        "name": nameController.text,
        "dose": doseController.text,
        "time": DateTime.now(),
        "user": widget.user,
      },
    );

    print(res.affectedRows);

    // close all connections
    await conn.close();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เพิ่มรายการแจ้งเตือนยา"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text('ชื่อยา'),
              ),
              onChanged: (value) => nameController.text = value,
            ),
            TextField(
              controller: doseController,
              decoration: const InputDecoration(
                label: Text('จำนวน'),
              ),
              onChanged: (value) => doseController.text = value,
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                label: Text('วันที่'),
              ),
              onChanged: (value) => dateController.text = value,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  await _insert();
                  // Navigator.pop(context, true);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(user: widget.user),
                    ),
                  );
                },
                child: const Text('เพิ่มรายการยา'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
