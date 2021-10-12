import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:read_novel/data/data_all.dart';
import 'package:read_novel/screan/read.dart';

import 'register.dart';

//หน้า login
class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  //เก็บ email ที่พิมพ์มา
  final TextEditingController _emailController = TextEditingController();
  //เก็บ password ที่พิมพ์มา
  final TextEditingController _passwordController = TextEditingController();
  late String email, password;
  // state loadding
  bool isLoading1 = false;
  bool passwordVisibility = false;
  // รูปการพิมพ์ email
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  //เเจ้งเตือน
  late ScaffoldMessengerState scaffoldMessenger;

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Form(
      child: Scaffold(
        //กำหนดสี background
        backgroundColor: const Color(0xFF00DCA7),
        body: SafeArea(
          // กำหนดให้สามารถเลื่อนได้
          child: SingleChildScrollView(
            child: Column(
              //กำหนดให้ column เต็มหน้าจอ
              mainAxisSize: MainAxisSize.max,
              // กำหนดให้ชิดซ้าย
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ภาพหนังสือ
                Align(
                  // กำหนดให้อยู่ตำเเหน่งกลาง
                  alignment: const AlignmentDirectional(0, 0),
                  //ใช่ภาพ svg จากเเพกเก็ด ภายนอก
                  child: SvgPicture.asset(
                    'assets/images/menu_book_black_24dp_green.svg',
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  //กำหนดให้อยู่ตรงกลาง
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(
                    'Writer Novel',
                    // กำหนดตำเเหน่ง font
                    textAlign: TextAlign.center,
                    //แต่ง font
                    style: GoogleFonts.poppins(
                      // กำหนดสี font
                      color: Colors.white,
                      // กำหนดขนาด font
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  // กำหนดให้ห่างจากด้านซ้าย 10 บน 30
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 30, 0, 0),
                  child: Text(
                    'Email',
                    //กำหนด ให้ตัวอักษรชิดซ้าย
                    textAlign: TextAlign.start,

                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                // TextFormField สำหรับ email
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: TextFormField(
                    controller: _emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFBFFFF7),
                      prefixIcon: const Icon(
                        Icons.people,
                      ),
                    ),
                    onSaved: (val) {
                      email = val!;
                    },
                    style: GoogleFonts.poppins(),
                    textAlign: TextAlign.start,
                    // ชนิดของการพิมพ์ เช่น number text email
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'Password',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                // TextFormField สำหรับ password
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: TextFormField(
                    controller: _passwordController,
                    // ซ้อนกับมองเห็น password
                    obscureText: !passwordVisibility,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFBFFFF7),
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                      ),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => passwordVisibility = !passwordVisibility,
                        ),
                        child: Icon(
                          passwordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0xFF00DCA7),
                          size: 22,
                        ),
                      ),
                    ),
                    style: GoogleFonts.poppins(),
                    textAlign: TextAlign.start,
                    onSaved: (val) {
                      email = val!;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Field is required';
                      }
                      return null;
                    },
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Stack(
                      children: [
                        SizedBox(
                          // กำหนด width ของsizedboxคือ 95%
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () async {
                              // ถ้ากดปุ่ม เเล้วมันโหลดอยุ่มันจะกดไม่ไป
                              if (isLoading1) {
                                return;
                              }
                              //เช็กว่าช่อง email,password ว่างหรือไม่
                              if (_emailController.text.isEmpty ||
                                  _passwordController.text.isEmpty) {
                                //ถ้าใช่ก็เเจ้งเตือนเเล้วก็ return กลับ ไม่ทำงานคำสั่งด้านล่างต่อ
                                scaffoldMessenger.showSnackBar(const SnackBar(
                                    content:
                                        Text("กรุณากรอกข้อมูลให้ครบทุกช่อง")));
                                return;
                              }
                              // เช็กรูปเเบบการพิมพิ์ email
                              if (!reg.hasMatch(_emailController.text)) {
                                //ถ้าใช่ก็เเจ้งเตือนเเล้วก็ return กลับ ไม่ทำงานคำสั่งด้านล่างต่อ
                                scaffoldMessenger.showSnackBar(const SnackBar(
                                    content: Text("ใส่อีเมลที่ถูกต้อง")));
                                return;
                              }
                              // เช็กว่า password พิมพิ์น้อยกว่า 6 หรือไม่
                              if (_passwordController.text.length < 6) {
                                //ถ้าใช่ก็เเจ้งเตือนเเล้วก็ return กลับ ไม่ทำงานคำสั่งด้านล่างต่อ
                                scaffoldMessenger.showSnackBar(const SnackBar(
                                    content: Text(
                                        "รหัสผ่านควรมีความยาวอย่างน้อย 6 ตัวอักษร")));
                                return;
                              }
                              // เมื่อกดให้ update หน้า
                              setState(() {
                                //กำหนด ให้ isLoading1 คือ true
                                isLoading1 = true;
                              });
                              print('object');

                              print('login');
                              // ระบบ login เพื่อเชื่อมกับ api
                              login(_emailController.text,
                                  _passwordController.text);
                              // ไปหน้าต่อไป
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Read(),
                                ),
                              );

                              // await Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         NavBarPage(initialPage: 'main_page'),
                              //   ),
                              // );
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF00DCA7),
                                fontSize: 18,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              side: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child:
                              (isLoading1) //ตัวโหลด จะเเสดงขึ้นมาเมื่อกดปุ่ม login
                                  ? const Center(
                                      child: SizedBox(
                                          height: 26,
                                          width: 26,
                                          child: CircularProgressIndicator(
                                            backgroundColor: Colors.green,
                                          )))
                                  : Container(),
                          right: 30,
                          bottom: 0,
                          top: 0,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.9, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      'Forget password?',
                      textAlign: TextAlign.end,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      '----------------------or----------------------',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: SizedBox(
                      width: 362,
                      height: 54,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 2, 0, 0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.95,
                                height: 54,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF1877F2),
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    side: const BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.transparent,
                                  ),
                                  label: Text(
                                    'Login with Facebook',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.98, -0.33),
                            child: Container(
                              width: 50,
                              height: 50,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/facebook.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: InkWell(
                      onTap: ()  {
                        // await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         NavBarPage(initialPage: 'main_page'),
                        //   ),
                        // );
                      },
                      child: SizedBox(
                        width: 362,
                        height: 54,
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: SizedBox(
                                width: 362,
                                height: 54,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    side: const BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                  ),
                                  onPressed: () {
                                    // ignore: avoid_print
                                    print('Button pressed ...');
                                  },
                                  label: Text(
                                    'Login with Google',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: const Color(0xFF606060),
                                      fontSize: 17,
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.transparent,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment:
                                  const AlignmentDirectional(-0.97, -0.44),
                              child: Container(
                                width: 50,
                                height: 50,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/google.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                      //ไปหน้า register เมื่อกด
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterWidget(),
                            ),
                          );
                        },
                        child: Text(
                          ' Register',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            textStyle: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 20.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ระบบล็อกอิน
  login(email, password) async {
    print('login');
    // Map data = {'email': email, 'password': password};
    final msg = jsonEncode({'email': email, 'password': password});
    print(msg.toString());
    print('http.post');
    //ส่งคำขอ HTTP POST พร้อมheaders เเละ bodyที่กำหนดไปยัง URL ที่กำหนด
    final response =
        await http.post(Uri.parse('https://$urltest.ngrok.io/api/user/token/'),
            headers: {
              // "Accept": "application/json",
              "Content-Type": "application/json",
              // "Content-Type": "application/x-www-form-urlencoded"
            },
            body: msg,
            encoding: Encoding.getByName("utf-8"));

    //ทำให้ตัวโหลดหายไป
    setState(() {
      print('isLoading = setState');
      isLoading1 = false;
    });

    print('headers คือ ${response.headers}');
    //ถ้า login ถูกต้องให้เข้าเงื่อนไข
    if (response.statusCode == 200) {
      print('if reponse = 200');
      print('ก่อนเข้า if error');
      print('scaffoldMessenger.showSnackBar resposne[message]');
      //แจ้งเตือนว่าเข้าสู่ระบบ
      scaffoldMessenger
          .showSnackBar(const SnackBar(content: Text("เข้าสู่ระบบ")));
    } 
    // ถ้า login ไม่สำเร็จ
    else {
      print('อื่น scaffoldMessenger.showSnackBar โปรดลองอีกครั้ง!');
      scaffoldMessenger
          .showSnackBar(const SnackBar(content: Text("กรุณาลองอีกครั้ง!")));
    }
  }
}
