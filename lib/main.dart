import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(new MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.teal,

  ),
    home:new HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar : new AppBar(
        title : new Text("Loading Json Data"),
      ),

      body: new Container(
              child: new Center(
               child: new FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString('load_json/person_data.json'),
                  builder: (context,snapshot){
                    var mydata = json.decode(snapshot.data.toString());

                    return new ListView.builder(
                      itemBuilder: (BuildContext context, int index){
                          return Card(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                new Text("name:"+mydata[index]['name']),
                                new Text("age:"+mydata[index]["age"]),
                                new Text("height:"+mydata[index]["height"]),
                                new Text("gender:"+mydata[index]["gender"]),
                                new Text("hair color:"+mydata[index]["hail_color"]),
                                
                              ],

                            ),

                          );
                      },
                      itemCount: mydata==null ? 0 : mydata.length,
                    );

                  },
                )
              )

      ),

    );
  }
}
