import 'package:flutter/material.dart';
import 'package:pillremind/pages/add_precep.dart';
import 'package:pillremind/pages/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          itemCount: 12,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset('images/pill.jpg'),
              ),
              title: const Text('พาราเซตามอล'),
              subtitle: const Text('2 เม็ด \n31 พฤษภาคม 2565'),
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
                builder: (context) => const AddPrec(),
              ));
        },
        tooltip: 'addPreception',
        child: const Icon(Icons.add),
      ),
    );
  }
}
