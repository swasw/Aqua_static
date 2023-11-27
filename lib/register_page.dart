import 'package:flutter/material.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'widgets/text_field.dart';
import 'package:client_information/client_information.dart';
import 'login_page.dart';
import 'theme.dart';
import 'widgets/buttons.dart';
import 'home_page.dart';
import 'widgets/pond_regist.dart';
import 'generator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

getId(String deviceid) async {
  ClientInformation info = await ClientInformation.fetch();
  deviceid = info.deviceId.toString();
  return deviceid;
}

class _RegisterPageState extends State<RegisterPage> {
  var nik = TextEditingController();
  var breeder_id = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var phone_number = TextEditingController();
  var warning = '';
  String id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor1,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(children: [
            Text(
              'Register',
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
                  "Sudah punya akun?",
                  style:
                      TextStyle(fontSize: 17, color: const Color(0xff999999)),
                ),
                InkResponse(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Ink(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 17, color: const Color(0xff38ABBE)),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(children: [
                      TextTile(
                        labelText: "NIK",
                        iconImage: Icon(null),
                        marginbot: 10,
                        controller: nik,
                      ),
                      TextTile(
                        labelText: "BreederID",
                        iconImage: Icon(null),
                        marginbot: 10,
                        controller: breeder_id,
                      ),
                      TextTile(
                        labelText: "Password",
                        iconImage: Icon(Icons.remove_red_eye),
                        marginbot: 10,
                        controller: password,
                      ),
                      TextTile(
                        labelText: "Nama",
                        iconImage: Icon(null),
                        marginbot: 10,
                        controller: name,
                      ),
                      TextTile(
                        labelText: "No. HP",
                        iconImage: Icon(null),
                        marginbot: 20,
                        controller: phone_number,
                      ),
                      PondRegisterContainer(),
                      InkWell(
                        onTap: () async {
                          getId(id);
                          // var token = await generateToken(breeder_id.text);
                          // var keys = await RSA.generate(1024);
                          // var msg =
                          //     '{"name":"${name.text}", "password":"${pw.text}", "phone_number": "${phone_number.text}", "token": "$token", "nik": "${nik.text}", "breeder_id":"${breeder_id.text}"}';

                          Map<String, dynamic> mp = Map<String, dynamic>();
                          mp.addEntries(
                              <String, dynamic>{"name": name.text}.entries);
                          mp.addEntries(<String, dynamic>{
                            "password": password.text
                          }.entries);

                          mp.addEntries(
                              <String, dynamic>{"nik": nik.text}.entries);

                          mp.addEntries(<String, dynamic>{
                            "phone_number": phone_number.text
                          }.entries);

                          mp.addEntries(<String, dynamic>{
                            "breeder_id": breeder_id.text
                          }.entries);

                          mp.addEntries(
                              <String, dynamic>{"deviceId": id}.entries);

                          String jsonString = jsonEncode(mp);
                          final jsonToPost = jsonDecode(jsonString);

                          // var url1 = Uri.http(
                          //     '127.0.0.1:5000', '/get_server_public_key');
                          // var response1 = await http.get(url1);

                          // var sv_pbkey = response1.body;

                          // // var encoded = utf8.encode(t);

                          // var enc_msg =
                          //     await RSA.encryptPKCS1v15(msg, sv_pbkey);

                          // // debugPrint(enc_msg.toString());

                          var url2 = Uri.http('127.0.0.1:5000', '/register');
                          var response2 =
                              await http.post(url2, body: jsonToPost);

                          debugPrint(response2.body);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              border: null),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Masuk',
                            style: whitestyle,
                            textAlign: TextAlign.center,
                          ),
                        ),

                        // child: Buttons(
                        //     boxcolor: primaryColor,
                        //     textcolor: Colors.white,
                        //     text: 'Daftar',
                        //     nav: HomaPage(
                        //       nama: breeder_id.text,
                        //     )),
                      ),
                    ])))
          ])),
        ));
  }
}
//           )],
//       )),
//     )
//   }
// }
