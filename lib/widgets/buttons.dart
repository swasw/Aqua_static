import 'package:flutter/material.dart';
import 'package:staticapp/theme.dart';
//DEPRECATED
class Buttons extends StatelessWidget {
  final Color boxcolor;
  final Color textcolor;
  final String text;
  var nav;

  Buttons(
      {super.key,
      required this.boxcolor,
      required this.textcolor,
      required this.text,
      required this.nav});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: boxcolor),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => nav));
        },
        child: Text(
          text,
          style: TextStyle(color: textcolor, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
