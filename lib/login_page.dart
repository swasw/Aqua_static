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
  var warning = '';
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
                                var url1 = Uri.http(
                                    '127.0.0.1:5000', '/get_server_public_key');
                                var response1 = await http.get(url1);
                                var sv_pbkey = response1.body;
                                var token = await generateToken(breederid.text);
                                var msg =
                                    '{"breeder_id": "${breederid.text}", "password": "${password.text}", "token": "$token"}';

                                var enc_msg =
                                    await RSA.encryptPKCS1v15(msg, sv_pbkey);
                                var url2 = Uri.http('127.0.0.1:5000', '/login');
                                var response2 = await http
                                    .post(url2, body: {'code': enc_msg});

                                debugPrint(response2.body);
                                if (response2.statusCode == 200) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePage(nama: breederid.text)));
                                } else {
                                  setState(() {
                                    warning = 'Data Anda Salah';
                                  });
                                }
                                // var body_json = jsonDecode(body);
                                // var url = Uri.http('127.0.0.1:5000', '/login');
                                // var response = await http.post(url, body: body_json);
                                // debugPrint('Response status: ${response.statusCode}');
                                // debugPrint('Response body: ${response.body}');
                              },
                            ),
                            Text(
                              warning,
                              style: TextStyle(
                                  color: alertColor,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
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
