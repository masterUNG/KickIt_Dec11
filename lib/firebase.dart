import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_ui_designs/appss.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class ClicksPerYear {
  final String year;
  int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}


class _MyHomePageState extends State<MyHomePage> {

 Color primaryColor = Colors.black12;
  int _counter = 0;
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;
  int _counter4 = 0;
  int _counter5 = 0;


  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('Match', _counter, Colors.green),
      ClicksPerYear('Goal', _counter1, Colors.blue),
      ClicksPerYear('Assist', _counter2, Colors.purple),
      ClicksPerYear('Clean', _counter3, Colors.white),
      ClicksPerYear('Yello', _counter4, Colors.yellow),
      ClicksPerYear('Red', _counter5, Colors.red),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(5.0),
      child: SizedBox(height: 320.0, child: chart),
    );



    return MaterialApp(
        home: Container(
            child: Stack(fit: StackFit.expand, children: <Widget>[
      Scaffold(
          backgroundColor: Colors.grey,
          body: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  SizedBox(height: 20,) , 
                  chartWidget,
                    
                Expanded(
                  child: _buildBody(context),
                
                )
              ]
              ),
              )
              )
    ])));
  }


  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('baby').snapshots(),
      
    
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 15.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

  
 
    

    return Padding(
        key: ValueKey(record.name),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      gradient: LinearGradient(
                        begin: FractionalOffset.bottomLeft,
                        end: FractionalOffset.topRight,
                        colors: <Color>[
                          Colors.white.withOpacity(0.9),
                          Colors.white10.withOpacity(0.5)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, offset: Offset(2, 2))
                      ]),
                  height: 55,
                  padding: EdgeInsets.only(
                    left: 15.0,
                    right: 15,
                  ),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Material(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              record.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              SizedBox.fromSize(
                                  size: Size(40, 40),
                                  child: ClipOval(
                                      child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                              splashColor: Colors.white,
                                              onTap: () => record.reference
                                                      .updateData({
                                                    'votes':
                                                        FieldValue.increment(-1)
                                                  }),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.remove,
                                                    size: 25,
                                                  ),
                                                ],
                                              ))))),
                              SizedBox(width: 15.0),

                              SizedBox.fromSize(
                                  size: Size(40, 40),
                                  child: ClipOval(
                                      child: Material(
                                          color: Colors.white70,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(record.votes.toString()),
                                            ],
                                          )))),
                              
                              SizedBox(width: 15.0),
                              SizedBox.fromSize(
                                  size: Size(40, 40),
                                  child: ClipOval(
                                      child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                              splashColor: Colors.white,
                                              onTap: () => record.reference
                                                      .updateData({
                                                    'votes':
                                                    FieldValue.increment(1)
                                                  }),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.add,
                                                    size: 25,
                                                  ),
                                                ],
                                              ))))),
                            ]),
                      ])),
            ]));
  }
}



class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}
