import 'package:flutter/material.dart';
import 'package:client_information/client_information.dart';
import 'package:staticapp/generator.dart';
import 'package:staticapp/login_page.dart';
import 'package:staticapp/theme.dart';
import 'widgets/pond_profile.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor1,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: backgroundColor1,
                ),
                padding: EdgeInsets.all(8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kolam',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.card_travel,
                        color: Colors.white,
                        size: 20,
                      )
                    ]),
              ),
              Row(
                children: [
                  CategoryButton(),
                  CategoryButton(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              PondProfile(),
              PondProfile(),
              PondProfile(),
              PondProfile(),
              PondProfile(),
              PondProfile(),
              TextButton(
                child: Text('Logout Test'),
                onPressed: () async {
                  var response =
                      await http.get(Uri.http("127.0.0.1:5000", "/logout"));
                  debugPrint(response.body);
                  if (response.statusCode == 200) {
                    navigator2(LoginPage(), context);
                  }
                },
              ),
            ],
          )),
        ));
  }
}
