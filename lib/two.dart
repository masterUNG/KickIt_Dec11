import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/myteam.dart';
import 'package:flutter_ui_designs/calendar.dart';
import 'package:flutter_ui_designs/scaffold/create_team.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_ui_designs/joins.dart';
import 'package:flutter_ui_designs/teamstats.dart';
import 'package:flutter_ui_designs/crud/presentation/pages/home.dart';

enum PageEnum {
  firstPage,
  secondPage,
}

class TwoTab extends StatefulWidget {
  @override
  _TwoTabState createState() {
    return _TwoTabState();
  }
}

class _TwoTabState extends State<TwoTab> {
  int counter = 0;

  _onSelect(PageEnum value) {
    switch (value) {
      case PageEnum.firstPage:
       print('First');
        routeToCreateTeam();
        break;
      case PageEnum.secondPage:
       print('Second');
        break;
    }
  }

  void routeToCreateTeam(){
    MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext buildContext){return CreateTeam();});
    Navigator.of(context).push(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.6,
                0.7,
                0.8,
                0.9
              ],
              colors: [
                Colors.black.withOpacity(0.85),
                Colors.black.withOpacity(0.82),
                Colors.black.withOpacity(0.81),
                Colors.black.withOpacity(0.75),
              ]),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 606,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      stops: [
                                        0.2,
                                        0.5,
                                        0.7,
                                        0.9
                                      ],
                                      colors: [
                                        Colors.white.withOpacity(0.9),
                                        Colors.white.withOpacity(0.9),
                                        Colors.white.withOpacity(0.99),
                                        Colors.white.withOpacity(0.99),
                                      ]),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(0)),
                                ),
                              ),
                              Container(
                                height: 758,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [
                                        0.6,
                                        0.7,
                                        0.8,
                                        0.9
                                      ],
                                      colors: [
                                        Colors.black.withOpacity(0.85),
                                        Colors.black.withOpacity(0.8),
                                        Colors.black.withOpacity(0.75),
                                        Colors.black.withOpacity(0.7),
                                      ]),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(0)),
                                ),
                              ),
                              Container(
                                height: 411,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      stops: [
                                        0.5,
                                        0.6,
                                        0.7,
                                        0.9
                                      ],
                                      colors: [
                                        Colors.white.withOpacity(0.5),
                                        Colors.white.withOpacity(0.6),
                                        Colors.white.withOpacity(0.7),
                                        Colors.white.withOpacity(0.8),
                                      ]),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(0)),
                                ),
                              ),
                              Container(
                                height: 310,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(0)),
                                    image: DecorationImage(
                                        image: AssetImage('assets/Team.jpg'),
                                        fit: BoxFit.cover)),
                              ),
                              Stack(children: <Widget>[
                                SizedBox(height: 60),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, top: 40, right: 20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          child: Row(children: <Widget>[
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.black
                                                      .withOpacity(0.9),
                                                ),
                                                width: 42,
                                                height: 24,
                                                padding: EdgeInsets.all(5),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text('LV.89',
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              )
                                            ]),
                                      ])),
                                      PopupMenuButton<PageEnum>(
                                        onSelected: _onSelect,
                                        child: Icon(Icons.menu,
                                            color: Colors.black),
                                        itemBuilder: (context) =>
                                            <PopupMenuEntry<PageEnum>>[
                                          PopupMenuItem<PageEnum>(
                                            value: PageEnum.firstPage,
                                            child: Text("Create Team Details"),
                                          ),
                                          PopupMenuItem<PageEnum>(
                                            value: PageEnum.secondPage,
                                            child: Text("Post Feed Pictures"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                              Positioned(
                                top: 265.0,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 30.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                    height: 40.0, width: 150.0),
                                                Container(
                                                    width: 110,
                                                    height: 110,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color:
                                                                Colors.black87,
                                                            width: 0.6),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/Club.jpg"),
                                                            fit:
                                                                BoxFit.cover))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 250.0, left: 130.0, right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [
                                          0.6,
                                          0.7,
                                          0.8,
                                          0.9
                                        ],
                                        colors: [
                                          Colors.black.withOpacity(0.88),
                                          Colors.black.withOpacity(0.87),
                                          Colors.black.withOpacity(0.86),
                                          Colors.black.withOpacity(0.85),
                                        ]),
                                  ),
                                  width: 400,
                                  height: 50,
                                  padding: EdgeInsets.only(
                                    left: 5,
                                    right: 5.0,
                                  ),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        SizedBox.fromSize(
                                            size: Size(50, 50),
                                            child: ClipOval(
                                                child: Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                        splashColor:
                                                            Colors.white,
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      JoinsTeam()));
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons.person_add,
                                                              size: 28,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            RichText(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              text: TextSpan(
                                                                text: "Joining",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 8,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ))))),
                                        SizedBox.fromSize(
                                            size: Size(50, 50),
                                            child: ClipOval(
                                                child: Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                        splashColor:
                                                            Colors.white,
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      MyTeam()));
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons.people,
                                                              size: 28,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            RichText(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              text: TextSpan(
                                                                text: "Member",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 8,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ))))),
                                        SizedBox.fromSize(
                                            size: Size(50, 50),
                                            child: ClipOval(
                                                child: Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                        splashColor:
                                                            Colors.white,
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      TeamStats()));
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons
                                                                  .insert_chart,
                                                              size: 28,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            RichText(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              text: TextSpan(
                                                                text: "Stats",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 8,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ))))),
                                        SizedBox.fromSize(
                                            size: Size(50, 50),
                                            child: ClipOval(
                                                child: Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                        splashColor:
                                                            Colors.white,
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      Calendar()));
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons
                                                                  .insert_invitation,
                                                              size: 28,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            RichText(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              text: TextSpan(
                                                                text:
                                                                    "Schedule",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 8,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ))))),
                                      ]),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 320.0, left: 130.0, right: 0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          height: 90,
                                          width: 178,
                                          color: Colors.transparent,
                                          padding: EdgeInsets.all(1),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      'ทีมไหน FC',
                                                      overflow:
                                                          TextOverflow.fade,
                                                      maxLines: 2,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Opensans',
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      '25 Member',
                                                      overflow:
                                                          TextOverflow.fade,
                                                      maxLines: 1,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      'Muang, Rayong, Thailand',
                                                      overflow:
                                                          TextOverflow.fade,
                                                      maxLines: 1,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                )),
                                              ])),
                                      Container(
                                        color: Colors.transparent,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: SizedBox(
                                                          height: 42,
                                                          width: 42,
                                                          child: RaisedButton(
                                                              child: Image.asset(
                                                                  'assets/arm5.png'),
                                                              elevation: 5.0,
                                                              shape:
                                                                  StadiumBorder(),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4),
                                                              color: Colors
                                                                  .white70,
                                                              splashColor: Colors
                                                                  .red
                                                                  .withOpacity(
                                                                      0.8),
                                                              onPressed: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (_) =>
                                                                                HomePage()));
                                                              }))),
                                                  SizedBox(width: 10),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Row(children: <Widget>[
                                                Text(
                                                  'Challenge',
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ]),
                                              SizedBox(height: 22),
                                            ]),
                                      ),
                                    ]),
                              ),
                              Stack(children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, top: 411, right: 0),
                                    child: Container(
                                        height: 185,
                                        child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: <Widget>[
                                              makeStory(
                                                storyImage:
                                                    'assets/atro/B1.jpg',
                                                userImage: 'assets/Ton.jpg',
                                              ),
                                              makeStory(
                                                storyImage:
                                                    'assets/atro/B2.jpg',
                                                userImage: 'assets/Ohh.jpg',
                                              ),
                                              makeStory(
                                                storyImage:
                                                    'assets/atro/B3.jpg',
                                                userImage: 'assets/Tons.jpg',
                                              ),
                                              makeStory(
                                                storyImage:
                                                    'assets/atro/B4.jpg',
                                                userImage: 'assets/Ohh.jpg',
                                              ),
                                              makeStory(
                                                storyImage:
                                                    'assets/atro/B1.jpg',
                                                userImage: 'assets/Ohh.jpg',
                                              ),
                                              makeStory(
                                                storyImage: 'assets/Soc.jpg',
                                                userImage: 'assets/Ohh.jpg',
                                              ),
                                            ]))),
                              ]),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 622, left: 15, right: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(0),
                                      color: Colors.transparent),
                                  height: 120,
                                  padding: EdgeInsets.only(left: 0, right: 0),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Flexible(
                                            child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text('Team established in 2019',
                                                overflow: TextOverflow.fade,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontFamily: 'Opensans',
                                                    fontSize: 18.0,
                                                    color: Colors.white)),
                                            likeButton()
                                          ],
                                        )),
                                        Flexible(
                                            child: Container(
                                          padding: EdgeInsets.all(0),
                                          child: Text('Manager: Mr.Mun',
                                              overflow: TextOverflow.fade,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontFamily: 'Opensans',
                                                  fontSize: 16.0,
                                                  color: Colors.white70)),
                                        )),
                                        Flexible(
                                            child: Container(
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                              'Assistance Manager: Yo, P-Nuyy & P-Eak',
                                              overflow: TextOverflow.fade,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontFamily: 'Opensans',
                                                  fontSize: 16.0,
                                                  color: Colors.white70)),
                                        )),
                                        Flexible(
                                            child: Container(
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                              'Team Slogan: ................',
                                              overflow: TextOverflow.fade,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontFamily: 'Opensans',
                                                  fontSize: 16.0,
                                                  color: Colors.white70)),
                                        )),
                                      ]),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 622, left: 15, right: 15),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          color: Colors.transparent),
                                      height: 120,
                                      padding:
                                          EdgeInsets.only(left: 0, right: 0),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Flexible(
                                                child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text('Team established in 2019',
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontFamily: 'Opensans',
                                                        fontSize: 18.0,
                                                        color: Colors.white)),
                                                likeButton()
                                              ],
                                            )),
                                            Flexible(
                                                child: Container(
                                              padding: EdgeInsets.all(0),
                                              child: Text('Manager: Mr.Mun',
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontFamily: 'Opensans',
                                                      fontSize: 16.0,
                                                      color: Colors.white70)),
                                            )),
                                            Flexible(
                                                child: Container(
                                              padding: EdgeInsets.all(0),
                                              child: Text(
                                                  'Assistance Manager: Yo, P-Nuyy & P-Eak',
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontFamily: 'Opensans',
                                                      fontSize: 16.0,
                                                      color: Colors.white70)),
                                            )),
                                            Flexible(
                                                child: Container(
                                              padding: EdgeInsets.all(0),
                                              child: Text(
                                                  'Team Slogan: ................',
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontFamily: 'Opensans',
                                                      fontSize: 16.0,
                                                      color: Colors.white70)),
                                            )),
                                          ]))),
                            ],
                          ),
                        ),
                      )),
                    ])),
          ],
        ),
      ),
    );
  }

  Widget likeButton() {
    return Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.transparent)),
        child: Center(
            child: LikeButton(
          size: 25,
          circleColor: CircleColor(start: Colors.red, end: Colors.redAccent),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Colors.red,
            dotSecondaryColor: Colors.redAccent,
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.favorite,
              color: isLiked ? Colors.redAccent : Colors.grey,
              size: 25,
            );
          },
          likeCount: 6895,
          countBuilder: (int count, bool isLiked, String text) {
            var color = isLiked ? Colors.white : Colors.grey;
            Widget result;
            if (count == 0) {
              result = Text(
                "love",
                style: TextStyle(color: color),
              );
            } else
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            return result;
          },
        )));
  }

  Widget makeStory({storyImage, userImage}) {
    return AspectRatio(
      aspectRatio: 1.4 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:
              DecorationImage(image: AssetImage(storyImage), fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.1),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.transparent, width: 0.5),
                    image: DecorationImage(
                        image: AssetImage(userImage), fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconBadge(
    IconData icon,
    String badgeText,
    Color badgeColor,
  ) {
    return Stack(
      children: <Widget>[
        Icon(
          icon,
          size: 35.0,
        ),
        Positioned(
          top: 2.0,
          right: 4.0,
          child: Container(
            padding: EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              color: badgeColor,
              shape: BoxShape.circle,
            ),
            constraints: BoxConstraints(
              minWidth: 15.0,
              minHeight: 15.0,
            ),
            child: Center(
              child: Text(
                badgeText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
