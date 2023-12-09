// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'text_field.dart';
import 'package:staticapp/theme.dart';

class PondRegisterContainer extends StatefulWidget {
  const PondRegisterContainer({super.key});

  @override
  State<PondRegisterContainer> createState() => PondRegisterContainerState();
}

class PondRegisterContainerState extends State<PondRegisterContainer> {
  Color sudahbutton = backgroundColor1;
  Color belumbutton = backgroundColor1;
  int post = 0;
  List widgets = [PondList(), PondRegist()];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Tempat Budidaya Anda Sudah Terdaftar?',
            style: whitestyle,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                setState(() {
                  sudahbutton = backgroundColor1;
                  belumbutton = secondaryColor;
                  post = 0;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: belumbutton,
                    borderRadius: BorderRadius.circular(10),
                    border: null),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  'Sudah',
                  style: whitestyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  sudahbutton = secondaryColor;
                  belumbutton = backgroundColor1;
                  post = 1;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: sudahbutton,
                    borderRadius: BorderRadius.circular(10),
                    border: null),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  'Belum',
                  style: whitestyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 15,
          ),
          widgets[post],
          SizedBox(height: 15,)
        ],
      ),
    );
  }
}

class PondRegist extends StatefulWidget {
  const PondRegist({super.key});
  @override
  State<PondRegist> createState() => _PondRegistState();
}

class _PondRegistState extends State<PondRegist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextTile(
              labelText: "Nama Tempat Budidaya",
              iconImage: Icon(null),
              marginbot: 10,
              controller: null,
              warning: "",
              type :String,
              tru: false,),
          TextTile(
              labelText: "Alamat",
              iconImage: Icon(null),
              marginbot: 10,
              controller: null,
              warning: "",
              type :String,
              tru: false,),
              
          TextTile(
              labelText: "Jumlah Pembudidaya (Opsional)",
              iconImage: Icon(null),
              marginbot: 10,
              controller: null,
              warning: "",
              type :String,
              tru: false,),
              
          TextTile(
              labelText: "Koordinat Lokasi(Opsional)",
              iconImage: Icon(null),
              marginbot: 10,
              controller: null,
              warning: "",
              type :String,
              tru: false,),
              
        ],
      ),
    );
  }
}

class PondList extends StatefulWidget {
  const PondList({
    super.key,
  });
  @override
  State<PondList> createState() => _PondListState();
}

class _PondListState extends State<PondList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Tempat Budidaya',
          style: whitestyle,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor1,
              borderRadius: BorderRadius.circular(10),
              border: null),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          width: MediaQuery.of(context).size.width,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Pilih Tempat Budidaya',
              style: whitestyle,
              textAlign: TextAlign.start,
            ),
            Icon(Icons.arrow_drop_down,color: Colors.white,)
          ]),
        ),
      ),
    ]);
  }
}
