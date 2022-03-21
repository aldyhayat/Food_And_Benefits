import 'package:flutter/material.dart';

class ListModel extends StatelessWidget {
  final gambar;
  final text;
  ListModel({this.gambar,this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: 260,
        height: 72,
        child: Card(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              '${gambar}',
              width: 64,
            ),
            SizedBox(
              width: 40,
            ),
            Center(
                child: Text(
              '${text}',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
            )),
          ]),
        ),
      ),
    );
  }
}
