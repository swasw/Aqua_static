import 'package:flutter/material.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:staticapp/home_page.dart';
import 'package:staticapp/theme.dart';
import 'widgets/text_field.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:client_information/client_information.dart';
import 'register_page.dart';
import 'widgets/buttons.dart';
import 'generator.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

// void getId(String deviceid) async {
//   ClientInformation info = await ClientInformation.fetch();
//   deviceid = info.deviceId.toString();
//   print(deviceid);
// }

class _LoginPageState extends State<LoginPage> {
  TextEditingController breederid = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String warning = "";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor1,
        body: SafeArea(
            child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/logov2.png",
                    width: 150,
                  ),
                  Text(
                    "Assistive Aquaculture Breeding Management",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff38ABBE)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "by Aquaculture Tech",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff999999)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            TextTile(
                              labelText: "BreederID",
                              iconImage: Icon(null),
                              marginbot: 10,
                              controller: breederid,
                              warning: warning,
                              type: String,
                              tru: false,
                            ),
                            TextTile(
                              labelText: "Password",
                              iconImage: Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                                size: 25,
                              ),
                              marginbot: 15,
                              controller: password,
                              warning: warning,
                              type: String,
                              tru: false,
                            ),
                            InkWell(
                              // child: Buttons(
                              //   boxcolor: primaryColor,
                              //   textcolor: Colors.white,
                              //   text: 'Login',
                              //   nav: RegisterPage(),
                              // ),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: null),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Masuk',
                                  style: whitestyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              onTap: () async {
                                var url = Uri.http('127.0.0.1:5000', '/login');

                                Map<String, dynamic> mp =
                                    new Map<String, dynamic>();

                                mp.addEntries(<String, dynamic>{
                                  "username": breederid.text
                                }.entries);

                                mp.addEntries(<String, dynamic>{
                                  "password": password.text
                                }.entries);

                                String jsonString = jsonEncode(mp);
                                debugPrint(jsonString);
                                final jsonToPost = jsonDecode(jsonString);

                                var response =
                                    await http.post(url, body: jsonToPost);

                                if (response.statusCode == 200) {
                                  debugPrint("Login Success");
                                  navigator2(HomePage(), context);
                                } else {
                                  debugPrint("Login Failed");
                                }
                              },
                              // Text(
                              //   warning,
                              //   style: TextStyle(
                              //       color: alertColor,
                              //       fontWeight: FontWeight.bold),
                              //   textAlign: TextAlign.start,
                              // )
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun?",
                        style: TextStyle(
                            fontSize: 17, color: const Color(0xff999999)),
                      ),
                      InkResponse(
                        onTap: () {
                          navigator2(RegisterPage(), context);
                        },
                        child: Ink(
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 17, color: const Color(0xff38ABBE)),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
