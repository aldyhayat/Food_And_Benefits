import 'package:flutter/material.dart';
import 'package:food/colors.dart';
import 'package:food/crud/update_data.dart';
import 'package:food/crud_sayuran/update_sayuran.dart';
import 'package:food/pages/list_sayuran.dart';
import 'package:http/http.dart' as http;

class DetailSayuran extends StatefulWidget {
  List list;
  int index;
  DetailSayuran({required this.list,required this.index});

  @override
  State<DetailSayuran> createState() => _DetailSayuranState();
}

class _DetailSayuranState extends State<DetailSayuran> {
   void deleteData(){
    var url=Uri.parse("http://192.168.254.107/food_fullstack/api_food/delete_sayuran.php");
    http.post(url, body: {
    'id': widget.list[widget.index]['id']
  });
  }

  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are u sure want delete? \n'${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Ok Delete!", style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: ()=> {
            setState(() {
               deleteData();
            Navigator.of(context).push(
              new MaterialPageRoute(builder: 
              (BuildContext context)=> new ListSayuran())
            );
            })
            },
          ),
          new RaisedButton(
          child: new Text("Cancel", style: new TextStyle(color: Colors.black),),
          color: Colors.green,
          onPressed: ()=>Navigator.pop(context)
          ),
      ],
    );
  showDialog(context: context, builder: (_)=> alertDialog);
  }
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
                        image: DecorationImage(image: NetworkImage("http://192.168.254.107/food_fullstack/api_food/uploads_sayuran/${widget.list[widget.index]['foto_makanan']}"), fit: BoxFit.fill),
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

                  SizedBox(height: 20,),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Row(
                      children: [
                        RaisedButton(
                            onPressed: ()=>Navigator.of(context).push(
                              new MaterialPageRoute(builder: (BuildContext context) =>  UpdateSayuran(list: widget.list, index: widget.index,))
                            ),
                            child: Text('Edit Data',style: TextStyle(color: Colors.white),),
                            color: darkGreen,
                          ),
                          SizedBox(width: 20,),
                          RaisedButton(
                            onPressed: ()=> confirm(),
                            child: Text('Delete Data',style: TextStyle(color: Colors.white)),
                            color: Colors.red,
                          ),
                        
                      ],
                    ),
                  )
                   
                  ],
                ),
              ],
            )
          ],
        )),
    );
  }
}