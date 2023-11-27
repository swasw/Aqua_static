
import 'package:flutter/material.dart';

class TextTile extends StatefulWidget {
  final String labelText;
  Icon iconImage;
  double marginbot;
  final controller;
  TextTile(
      {required this.labelText,
      required this.iconImage,
      required this.marginbot,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  State<TextTile> createState() => _TextTileState();
}

class _TextTileState extends State<TextTile> {
  int eyes = 1;
  var obscuretext = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget.controller,
          obscureText: obscuretext,
          style: TextStyle(color: Colors.white, fontSize: 12),
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          decoration: InputDecoration(
              hintText: widget.labelText,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              hintStyle: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 145, 145, 145)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 182, 182, 182), width: 1)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: InkWell(
                  onTap: () {
                    eyes += 1;
                    setState(() {
                      if (eyes % 2 == 0) {
                        widget.iconImage = Icon(Icons.visibility_off);
                        obscuretext = true;
                      } else {
                        widget.iconImage = Icon(Icons.remove_red_eye);
                        obscuretext = false;
                      }
                    });
                  },
                  child: widget.iconImage)),
        ),
        SizedBox(
          height: widget.marginbot,
        )
      ],
    );
  }
}
