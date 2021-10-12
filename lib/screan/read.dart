import 'package:flutter/material.dart';
import 'package:read_novel/service/api.dart';

// หน้านิยาย
class Read extends StatefulWidget {
  const Read({Key? key}) : super(key: key);

  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  @override
  void initState() {
    print('เข้า api');
    //เอาไว้ทดสอบว่ายืนยันตัวตนหรือยัง
    Api.get();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(child: Text('Read')),
    );
  }
}
