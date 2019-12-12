import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/appss.dart';
import 'package:flutter_ui_designs/lesson.dart';
import 'package:flutter_ui_designs/two.dart';

class ThreeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThreeTab();
  }
}

class _ThreeTab extends State<ThreeTab> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage("assets/Team.jpg"),
          ),
          title: Row(
            children: <Widget>[
              Text(
                lesson.title,
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    width: 20,
                    child: LinearProgressIndicator(
                        backgroundColor: Colors.black26,
                        value: lesson.indicatorValue,
                        valueColor: AlwaysStoppedAnimation(Colors.green)),
                  )),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text(lesson.address,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 11,
                        ))),
              ),
            ],
          ),
          trailing: Text(lesson.member,
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: TextStyle(color: Colors.black87, fontSize: 12)),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TwoTab()));
          },
        );

    Card makeCard(Lesson lesson) => Card(
          elevation: 3.0,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white12),
            child: makeListTile(lesson),
          ),
        );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

    final topAppBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.navigate_before),
        onPressed: () {
          // Navigator.of(context).pop();
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext buildContext) {
            return CustomAppBarDemo(currentIndex: 1,);
          });
          Navigator.of(context).pushAndRemoveUntil(
              materialPageRoute, (Route<dynamic> route) => false);
        },
      ),
      elevation: 0.1,
      backgroundColor: Colors.black54,
      title: Text('Soccer Community'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

List getLessons() {
  return [
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
    Lesson(
      title: "ทีมไหน FC",
      member: "25 Member",
      indicatorValue: 0.89,
      address: "Muang, Rayong, Thailand",
    ),
  ];
}
