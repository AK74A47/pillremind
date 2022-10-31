import 'package:flutter/material.dart';
import 'package:pillremind/pages/homepage.dart';

class AddPrec extends StatelessWidget {
  const AddPrec({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController dose = TextEditingController();
    TextEditingController date = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("เพิ่มรายการแจ้งเตือนยา"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                label: Text('ชื่อยา'),
              ),
            ),
            TextField(
              controller: dose,
              decoration: const InputDecoration(
                label: Text('จำนวน'),
              ),
            ),
            TextField(
              controller: date,
              decoration: const InputDecoration(
                label: Text('วันที่'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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
