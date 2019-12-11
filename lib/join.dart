import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/joinbar/joins.dart';
import 'package:flutter_ui_designs/joinbar/myappbar.dart';
import 'package:flutter_ui_designs/joinbar/myflexiableappbar.dart';


class Join extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Join();
  }
}

  class _Join extends State<Join> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:  CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: MyAppBar(),
              pinned: true,
              expandedHeight: 240.0,
              backgroundColor: Colors.black87.withBlue(7),

              flexibleSpace: FlexibleSpaceBar(
                background: MyFlexiableAppBar(),
                collapseMode: CollapseMode.pin,
                 
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [ 
                  SliverListDetail(), 
                  
                ],
               
              ),
            ),
            SliverFillRemaining(
              child: Joins(), 
            )
            ]));
  }
  
    Widget SliverListDetail() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text('WANT TO JOIN THE TEAM?'),
              ),
              Container(
                child: RaisedButton(
                  color: Colors.greenAccent,
                  child: Text(
                    'Join',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              )
            ]),
      );
    }

}
