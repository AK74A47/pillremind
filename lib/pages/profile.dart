import 'package:flutter/material.dart';
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

  @override
  void initState() {
    nameController.text = 'สมหมาย';
    genderController.text = 'ชาย';
    ageController.text = '59';
    usernameController.text = 'aazz1239';
    passwordController.text = '123456789';
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
