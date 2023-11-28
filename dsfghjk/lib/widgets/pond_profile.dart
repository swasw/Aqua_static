import 'package:flutter/material.dart';
import 'package:staticapp/theme.dart';

class PondProfile extends StatefulWidget {
  const PondProfile({super.key});

  @override
  State<PondProfile> createState() => _PondProfileState();
}

class _PondProfileState extends State<PondProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'alias kolam',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green),
                alignment: Alignment.center,
                child: Text(
                  'status',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '22-11-2023',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('pH: ',textAlign: TextAlign.end,),SizedBox(width: 8,), Text('4',textAlign: TextAlign.end,)],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.free_cancellation_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '6 Hari',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Do: ',textAlign: TextAlign.end,),SizedBox(width: 8,), Text('4',textAlign: TextAlign.end,)],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/fish_transparent.png',
                    width: 24,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '250 Ekor',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Suhu: ',textAlign: TextAlign.end,),SizedBox(width: 8,), Text('21 C',textAlign: TextAlign.end,)],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  const CategoryButton({super.key});

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  var colortap = backgroundColor1;
  var textap = Colors.white;
  int post = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (post == 0) {
            post = 1;
            colortap = Colors.white;
            textap = backgroundColor1;
          } else {
            post = 0;
            colortap = backgroundColor1;
            textap = Colors.white;
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: colortap,
        ),
        child: Text(
          'aktif',
          style: TextStyle(color: textap, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
