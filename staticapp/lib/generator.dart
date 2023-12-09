import 'dart:convert';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:client_information/client_information.dart';
import 'package:staticapp/home_page.dart';
import 'package:staticapp/login_page.dart';
import 'package:staticapp/register_page.dart';

navigator2(var y, context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => y));
}

getDeviceId() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final info = await deviceInfoPlugin.windowsInfo;

  return info.deviceId;
}

// getClientId(String id) async {
//   ClientInformation info = await ClientInformation.fetch();
//   id = info.deviceId.toString();
//   return id;
// }

generateToken(String un) async {
  var deviceId = await getDeviceId();
  var bytes1 = sha256.convert(utf8.encode(deviceId + un));
  return bytes1.toString();
}

// navigator(var x, bool y, List routes) {
//   if (x == LoginPage() && y == true) {
//     x = 1;
//   } else if (x == LoginPage() && y == false) {
//     x = 2;
//   } else if (x == RegisterPage() && y == true) {
//     x = 1;
//   } else if (x == HomePage() && y == false) {
//     x = 0;
//   }
// }

test() async {
  var ks = await RSA.generate(512);
  String pbk = """
-----BEGIN RSA PUBLIC KEY-----
MEgCQQDHBqVzzHizjzc8UyBqtaLpWWM3JTO6ujZzq7oCl//vNlXPcf7Znco80VhN
2ETikMK4lvHIj2VDw2WwKwujSmTjAgMBAAE=
-----END RSA PUBLIC KEY-----
""";
  //final userMap = jsonDecode(jsonString) as Map<String, dynamic>;
  Map<String, dynamic> mp = Map<String, dynamic>();
  mp.addEntries(<String, dynamic>{"mmm": 1}.entries);
  String json = jsonEncode(mp);

//   var msg = """
//   {
//     "name" : "Asano Shogo",
//     "team" : "Takamatsu Shogyou",
//     "hitrate": 3.89
//   }

//  """;

  var enc = await RSA.encryptPKCS1v15(json, pbk);

  // var dec = await RSA.decryptPKCS1v15(enc, ks.privateKey);

  // debugPrint(dec);

  // var pbkey = ks.publicKey;
  // var pvkey = ks.privateKey;

  debugPrint(enc);
}

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        email = json['email'] as String;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
