import 'package:flutter/material.dart';
import 'package:pillremind/pages/homepage.dart';
import 'package:pillremind/pages/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(label: Text('ชื่อผู้ใข้')),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(label: Text('รหัสผ่าน')),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home', (Route<dynamic> route) => false);
                    },
                    child: const Text('เข้าสู่ระบบ'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/register', (Route<dynamic> route) => false);
                    },
                    child: const Text('สมัครสมาชิก'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
