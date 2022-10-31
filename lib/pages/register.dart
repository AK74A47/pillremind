import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              controller: ageController,
              decoration: const InputDecoration(
                label: Text('อายุ'),
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
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (Route<dynamic> route) => false);
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
