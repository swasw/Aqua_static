import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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

class _RegisterPageState extends State<RegisterPage> {
  static List<int> warnings = [];
  var nik = TextEditingController();
  var breeder_id = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var phone_number = TextEditingController();
  var warning = '';
  String id = '';
  bool warned = false;

  void register() async {
    var response = await http.post(
      Uri.http('127.0.0.1:5000', '/register'),
      body: {
        "id": id,
        "breeder_id": breeder_id.text,
        "password": password.text,
        "nik": nik.text,
        "nama": name.text,
        "phone": phone_number.text,
      },
    );
    var data = jsonDecode(response.body);
  }

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
                        warning: "",
                        type: int,
                        tru: false,
                      ),
                      TextTile(
                        labelText: "BreederID",
                        iconImage: Icon(null),
                        marginbot: 10,
                        controller: breeder_id,
                        warning: "",
                        type: "UniqString",
                        tru: false,
                      ),
                      TextTile(
                        labelText: "Password",
                        iconImage: Icon(Icons.remove_red_eye),
                        marginbot: 10,
                        controller: password,
                        warning: "",
                        type: "UniqString",
                        tru: false,
                      ),
                      TextTile(
                        labelText: "Nama",
                        iconImage: Icon(null),
                        marginbot: 10,
                        controller: name,
                        warning: "",
                        type: String,
                        tru: false,
                      ),
                      TextTile(
                        labelText: "No. HP",
                        iconImage: Icon(null),
                        marginbot: 20,
                        controller: phone_number,
                        warning: "",
                        type: "phone",
                        tru: false,
                      ),
                      PondRegisterContainer(),
                      InkWell(
                        onTap: () async {
                          // getClientId(id);
                          // register();

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
                            "username": breeder_id.text
                          }.entries);

                          String jsonString = jsonEncode(mp);
                          debugPrint(jsonString);
                          final jsonToPost = jsonDecode(jsonString);
                          var response = await http.post(
                              Uri.http('127.0.0.1:5000', '/register'),
                              body: jsonToPost);

                          if (response.statusCode == 200) {
                            debugPrint("Register success");
                            navigator2(HomePage(), context);
                          } else {
                            debugPrint("Register failed");
                          }
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
                            'Daftar',
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
