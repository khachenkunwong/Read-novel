import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:read_novel/data/data_all.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'login.dart';

import 'dart:convert';

//หน้า login
class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  //เก็บ name ที่พิมพ์มา
  final TextEditingController _nameController = TextEditingController();
  //เก็บ email ที่พิมพ์มา
  final TextEditingController _emailController = TextEditingController();
  //เก็บ password ที่พิมพ์มา
  final TextEditingController _passwordController = TextEditingController();
  bool passwordVisibility1 = false;
  final TextEditingController _confirmController = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool passwordVisibility2 = false;

  late String name, email, password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Form(
      child: Scaffold(
        backgroundColor: const Color(0xFF00DCA7),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: SvgPicture.asset(
                    'assets/images/menu_book_black_24dp_green.svg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(
                    'Writer Novel',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                  child: Text(
                    'Username',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: TextFormField(
                    controller: _nameController,
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
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'Email',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
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
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'Password',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: !passwordVisibility1,
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
                          () => passwordVisibility1 = !passwordVisibility1,
                        ),
                        child: Icon(
                          passwordVisibility1
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0xFF00DCA7),
                          size: 22,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Field is required';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'Confirm Password',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: TextFormField(
                    controller: _confirmController,
                    obscureText: !passwordVisibility2,
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
                          () => passwordVisibility2 = !passwordVisibility2,
                        ),
                        child: Icon(
                          passwordVisibility2
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0xFF00DCA7),
                          size: 22,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Field is required';
                      }

                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Stack(
                      children: [
                        // ปุ่มกดที่ออกเเบบไว้
                        FFButtonWidget(
                          onPressed: () {
                            // เช็คว่าใส่ ครบทั้งหมดหรือไหม
                            if (_nameController.text.isEmpty ||
                                _passwordController.text.isEmpty ||
                                _emailController.text.isEmpty ||
                                _confirmController.text.isEmpty) {
                              scaffoldMessenger.showSnackBar(const SnackBar(
                                  content:
                                      Text("กรุณากรอกข้อมูลให้ครบทุกช่อง")));
                              return;
                            }
                            // เช็กรูปเเบบการพิมพิ์ email
                            if (!reg.hasMatch(_emailController.text)) {
                              scaffoldMessenger.showSnackBar(const SnackBar(
                                  content: Text("ใส่อีเมลที่ถูกต้อง")));
                              return;
                            }
                            // เช็กว่า password พิมพิ์น้อยกว่า 6 หรือไม่
                            if (_passwordController.text.length < 6) {
                              scaffoldMessenger.showSnackBar(const SnackBar(
                                  content: Text(
                                      "รหัสผ่านควรมีความยาวอย่างน้อย 6 ตัวอักษร")));
                              return;
                            }
                            // เช็คว่า password ตรงกันหรือไหม
                            if (_passwordController.text !=
                                _confirmController.text) {
                              scaffoldMessenger.showSnackBar(const SnackBar(
                                  content:
                                      Text("กรุณาใส่ password ให้ตรงกัน")));
                              return;
                            }

                            // await Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => UplordImageWidget(),
                            //   ),
                            // );
                            // กำหนด state โหลด
                            setState(() {
                              isLoading = true;
                            });
                            signup(_nameController.text, _emailController.text,
                                _passwordController.text);

                            // เมื่อกดปุ่มเเล้ว จะย้อนกลับไปหน้าก่อน
                            Navigator.pop(context);
                          },
                          //ข้อความในปุ่ม
                          text: 'Register',
                          //ทำการตั้งค่าปุ่ม
                          options: FFButtonOptions(
                            width: 362,
                            height: 45,
                            //สีปุ่ม
                            color: Colors.white,
                            //เเต่ข้อความ
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              color: const Color(0xFF00DCA7),
                              fontSize: 18,
                            ),
                            //กำหนดระดับความสูง ด้านหลังปุ่ม
                            elevation: 2,
                            //กำหนดความโค้งของคอบ
                            borderRadius: 12,
                          ),
                        ),
                        //เมื่อมีการกดจะเเสดง ตัวโหลด
                        Positioned(
                          child: (isLoading)
                              ? const Center(
                                  child: SizedBox(
                                      height: 26,
                                      width: 26,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.green,
                                      )))
                              : Container(),
                          //กำหนดตำแหน่ง
                          right: 30,
                          bottom: 0,
                          top: 0,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      '----------------------or----------------------',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                              child: FFButtonWidget(
                                onPressed: () {},
                                text: 'Login with Facebook',
                                options: FFButtonOptions(
                                  width: 362,
                                  height: 54,
                                  color: const Color(0xFF1877F2),
                                  textStyle: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                  ),
                                  elevation: 4,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  borderRadius: 30,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            //กำหนดตำแหน่งของหน้า ภาพ facebook
                            alignment: const AlignmentDirectional(-0.98, -0.33),
                            child: Container(
                              width: 50,
                              height: 50,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png?w=512&h=512',
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
                    child: SizedBox(
                      width: 362,
                      height: 54,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                // ignore: avoid_print
                                print('Button pressed ...');
                              },
                              text: 'Login with Google',
                              options: FFButtonOptions(
                                width: 362,
                                height: 54,
                                color: Colors.white,
                                textStyle: GoogleFonts.getFont(
                                  'Roboto',
                                  color: const Color(0xFF606060),
                                  fontSize: 17,
                                ),
                                elevation: 4,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                ),
                                borderRadius: 30,
                              ),
                            ),
                          ),
                          //กำหนดตำแหน่งของหน้า ภาพ google
                          Align(
                            alignment: const AlignmentDirectional(-0.97, -0.44),
                            child: Container(
                              width: 50,
                              height: 50,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                      ),
                      //กำหนดเมื่อกดจะไปหน้า login
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginWidget(),
                            ),
                          );
                        },
                        child: Text(
                          'Login',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ระบบสมัครสมาชิก
  signup(name, email, password) async {
    print("Calling");
    // นำ email password name ที่พิมพ์มาเก็บไว้ตามที่กำหนดเเล้วเอามาเก็บไว้ในตัวเเปลชนิด map ที่ชื่อdata
    Map data = {'email': email, 'password': password, 'name': name};
    // final msg = jsonEncode({'email': email, 'password': password, 'name': name});
    print(data.toString());
    //ส่งคำขอ HTTP POST พร้อมheaders เเละ bodyที่กำหนดไปยัง URL ที่กำหนด
    final response = await http.post(
        Uri.parse('https://$urltest.ngrok.io/api/user/create/'),
        body: data,
        encoding: Encoding.getByName("utf-8"));
    //ทำให้ตัวโหลดหายไป
    setState(() {
      isLoading = false;
    });
    //ถ้าสมัครสำเร็จ
    if (response.statusCode == 201) {
      print('response = 201');
      //แจ้งเตื่อนเมื่อสมัครสำเร็จ
      scaffoldMessenger
          .showSnackBar(const SnackBar(content: Text("สมัครสำเร็จ")));
    //ถ้าสมัครไม่สำเร็จ
    } else {
      //แจ้งเตื่อนเมื่อสมัครไม่สำเร็จ
      scaffoldMessenger
          .showSnackBar(const SnackBar(content: Text("ลองใหม่อีกครั้ง")));
    }
  }
}
