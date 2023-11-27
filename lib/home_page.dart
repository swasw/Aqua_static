import 'package:flutter/material.dart';
import 'package:client_information/client_information.dart';
import 'package:staticapp/login_page.dart';
import 'package:staticapp/theme.dart';

class HomePage extends StatefulWidget {
  final String nama;
  const HomePage({super.key, required this.nama});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child:Align(
          alignment: Alignment.center,
          child: Icon(Icons.home,size: 300,color: primaryColor,))
    ));
  }
}
