import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:pillremind/pages/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _readAll() async {
    print("Connecting to mysql server...");

    // create connection
    final conn = await MySQLConnection.createConnection(
      host: "10.0.2.2",
      port: 3306,
      userName: "user",
      password: "1234",
      databaseName: "pillremind",
      secure: false,
    );

    await conn.connect();

    print("Connected");

    // make query
    var result = await conn.execute("SELECT * FROM user ORDER BY id ASC");

    // print query result
    List<Map<String, String>> list = [];
    for (final row in result.rows) {
      final data = {
        'id': row.colAt(0)!,
        'name': row.colAt(1)!,
        'password': row.colAt(2)!,
        'username': row.colAt(3)!,
        'telephone': row.colAt(4)!,
        'gender': row.colAt(5)!
      };
      list.add(data);
    }
    print('Query Success');

    setState(() {
      list;
      print(list);
      nameController.text = list[0]['name']!;
      genderController.text = list[0]["gender"]!;
      genderController.text = list[0]["gender"]!;
      usernameController.text = list[0]["username"]!;
      passwordController.text = list[0]["password"]!;
    });

    // close all connections
    await conn.close();
  }

  @override
  void initState() {
    _readAll();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('โปรไฟล์'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              label: Text('ชื่อ'),
            ),
          ),
          TextField(
            controller: genderController,
            decoration: const InputDecoration(
              label: Text('เพศ'),
            ),
          ),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              label: Text('ชื่อผู้ใช้'),
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              label: Text('รหัสผ่าน'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text('ออกจากระบบ'),
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
