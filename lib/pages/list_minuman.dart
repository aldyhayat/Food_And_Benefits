import 'package:flutter/material.dart';
import 'package:food/pages/detail_minuman.dart';
import 'package:food/pages/detail_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListMinuman extends StatefulWidget {
  const ListMinuman({ Key? key }) : super(key: key);

  @override
  State<ListMinuman> createState() => _ListMinumanState();
}

class _ListMinumanState extends State<ListMinuman> {
  Future<List> getData() async {
    final response = await http.get(
        Uri.parse("http://192.168.254.107/food_fullstack/api_food/read_minuman.php"));
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffAEFEFF),
      body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new itemList(
                    list: snapshot.data ?? [],
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          }),
     
    );
  }
}



class itemList extends StatelessWidget {
  final List list;
  
  itemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/back_btn.png',
                    width: 40,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Minuman',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'manfaat berbagai macam Minuman.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: new ListView.builder(
                    itemCount: list == null ? 0 : list.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30, bottom: 5),
                        child: new Container(
                          height: 72,
                          child: new GestureDetector(
                            onTap: ()=> Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (
                                  (BuildContext context) => new DetailMinumanUser(list: list, index: index,))
                              )
                            ),
                            child: Card(
                              elevation: 5,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      'http://192.168.254.107/food_fullstack/api_food/uploads_minuman/${list[index]['foto_makanan']}',
                                      width: 64,
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Center(
                                        child: Text(
                                      list[index]['nama'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 30),
                                    )),
                                  ]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}