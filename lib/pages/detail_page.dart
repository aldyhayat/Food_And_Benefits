import 'package:flutter/material.dart';
import 'package:food/colors.dart';
import 'auth_page/login.dart';

class DetailScreen extends StatefulWidget {
  List list;
  int index;
  DetailScreen({required this.list,required this.index});


  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffAEFEFF),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      width: 370,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage("http://192.168.254.107/food_fullstack/api_food/uploads/${widget.list[widget.index]['foto_makanan']}"), fit: BoxFit.fill),
                      ),       
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Text('${widget.list[widget.index]['nama']}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 36),),
                    ),
                    SizedBox(height: 4,),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text('${widget.list[widget.index]['penjelasan']}'),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ExpansionTile(
                        title: Text('Kandungan'),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text('${widget.list[widget.index]['kandungan']}'),
                          ),
                        ],
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ExpansionTile(
                        title: Text('Manfaat'),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text('${widget.list[widget.index]['manfaat']}'),
                          ),
                        ],
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ExpansionTile(
                        title: Text('Dampak Buruk'),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text('${widget.list[widget.index]['dampak_buruk']}'),
                          ),
                        ],
                        ),
                    ),

                
                  
                   
                  ],
                ),
              ],
            )
          ],
        )),
    );
  }
}
