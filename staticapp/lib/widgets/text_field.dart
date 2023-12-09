import 'package:flutter/material.dart';
import 'package:staticapp/theme.dart';
import 'package:staticapp/register_page.dart';


class TextTile extends StatefulWidget {
  final String labelText;
  Icon iconImage;
  double marginbot;
  final controller;
  String warning;
  var type;
  bool tru;
  TextTile(
      {required this.labelText,
      required this.iconImage,
      required this.marginbot,
      required this.controller,
      required this.warning,
      required this.type,
      required this.tru,
      Key? key})
      : super(key: key);

  @override
  State<TextTile> createState() => _TextTileState();
}

class _TextTileState extends State<TextTile> {
  int eyes = 0;
  
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
          
          onChanged: (value) {
            if (value.isNotEmpty && widget.type == int) {
              try {
                int intval = int.parse(value);
                print('maud');
                setState(() {
                  widget.warning = "";
                });
                if (value.length <= 16) {
                  setState(() {
                    widget.warning = "NIK harus lebih dari 16 karakter";
                  });
                } else {
                  setState(() {
                    widget.warning = "";
                  });
                }
              } catch (e) {
                setState(() {
                  widget.warning = "Tipe Data tidak sesuai";
                });
                print('mandi');
                // You might handle this case here (e.g., show an error)
              }
            } else if (value.isNotEmpty && widget.type == "UniqString") {
              if (value.length < 6) {
                widget.warning = "Data harus lebih dari 6 karakter";
              } else {
                widget.warning = "";
              }
            } else if (value.isNotEmpty && widget.type == String) {
              widget.warning = "";
            } else if (value.isEmpty) {
              widget.warning = "Data tidak boleh kosong";
            } else {
              widget.tru = true;
            }
          },

          // onEditingComplete: (){
          //     try {
          //       int intval = int.parse(value);
          //       print('maud');
          //     } catch (e) {
          //       setState(() {
          //         widget.warning = "Tipe Data tidak sesuai";
          //       });
          //       print('mandi');
          //     }
          //   },

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
        Text(
          widget.warning,
          style: TextStyle(color: alertColor),
        ),
        SizedBox(
          height: widget.marginbot,
        )
      ],
    );
  }
}
