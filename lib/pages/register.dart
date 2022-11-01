import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _addProfile() async {
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
      "INSERT INTO `user` ( `name`, `password`, `username`, `telephone`, `gender`) VALUES ( :name, :password, :username, :telephone, :gender);",
      {
        "name": nameController.text,
        "gender": genderController.text,
        "username": usernameController.text,
        "telephone": telephoneController.text,
        "password": passwordController.text,
      },
    );

    print(res.affectedRows);

    // close all connections
    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text('ชื่อ'),
              ),
            ),
            TextField(
              controller: telephoneController,
              decoration: const InputDecoration(
                label: Text('เบอร์โทร'),
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
              decoration: const InputDecoration(
                label: Text('รหัสผ่าน'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () async {
                          await _addProfile();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (Route<dynamic> route) => true);
                        },
                        child: const Text('สมัครสมาชิก')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
