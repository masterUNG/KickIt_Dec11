import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/ones.dart';
import 'package:flutter_ui_designs/profile_image.dart';
import 'dart:ui';
import 'package:multi_charts/multi_charts.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_ui_designs/profile.dart';
import 'package:flutter_ui_designs/fourrr.dart';

enum PageEnum {
  firstPage,
  secondPage,
}

class OneTab extends StatefulWidget {
  @override
  _OneTabState createState() {
    return _OneTabState();
  }
}

class _OneTabState extends State<OneTab> {
  // Field
  String uidLogin, urlPathImage;

  List<String> keyData = [
    'profileName',
    'nameTeam',
    'shirtNumber',
    'position',
    'foot',
    'age',
    'height',
    'weight',
    'speed',
    'kick',
    'pass',
    'curve',
    'stamina',
    'jump'
  ];

  List<String> valueDataUsers = List();

  // Method
  @override
  void initState() {
    super.initState();
    findUID();
  }

  Future<void> findUID() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser().then((object) {
      uidLogin = object.uid;
      findPathUrlImage();
      readAllDataUser();
    });
  }

  Future<void> readAllDataUser() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('User');
    await collectionReference
        .document(uidLogin)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      print('document = ${documentSnapshot.data}');

      int index = 0;
      for (var string in keyData) {
        String value = documentSnapshot.data[string];
        valueDataUsers.add(value);
        print('valueDataUsers[$index] = ${valueDataUsers[index]}');
        index++;
      }
    });
  }

  Future<void> findPathUrlImage() async {
    try {
      Firestore firestore = Firestore.instance;
      CollectionReference collectionReference = firestore.collection('Avatar');
      await collectionReference
          .document(uidLogin)
          .snapshots()
          .listen((DocumentSnapshot documentSnapshot) {
        print('document = ${documentSnapshot.data}');
        setState(() {
          urlPathImage = documentSnapshot.data['PathURL'];
        });
        print('url = $urlPathImage');
      });
    } catch (e) {}
  }

  _onSelect(PageEnum value) {
    switch (value) {
      case PageEnum.firstPage:
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => EditProfile()));
        break;
      case PageEnum.secondPage:
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => ProfileImage()));
        break;
    }
  }

  Widget showImageDeflult() {
    return Container(
      height: 565,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4)),
        image: DecorationImage(
            image: AssetImage("assets/Moc.jpg"), fit: BoxFit.cover),
      ),
    );
  }

  Widget showImageNetwork() {
    return Container(
      height: 565,
      child: Image.network(
        urlPathImage,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.5,
                    0.7,
                    0.9
                  ],
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.4),
                  ]),
            ),
            child: Stack(fit: StackFit.expand, children: <Widget>[
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
                                child: Stack(children: <Widget>[
                                  Container(
                                    height: 771,
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
                                            Colors.black.withOpacity(0.7),
                                            Colors.black.withOpacity(0.65),
                                            Colors.black.withOpacity(0.6),
                                            Colors.black.withOpacity(0.55),
                                          ]),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0)),
                                    ),
                                  ),
                                  Stack(children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 30, right: 10),
                                      child: urlPathImage == null
                                          ? showImageDeflult()
                                          : showImageNetwork(),
                                    )
                                  ]),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 535, left: 20),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                                  Colors.black
                                                      .withOpacity(0.85),
                                                  Colors.black
                                                      .withOpacity(0.83),
                                                  Colors.black
                                                      .withOpacity(0.81),
                                                  Colors.black.withOpacity(0.8),
                                                ]),
                                          ),
                                          width: 200,
                                          height: 50,
                                          padding: EdgeInsets.only(
                                              left: 23, right: 23.0),
                                          child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "39\n",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "AGE",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "183\n",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "HEIGHT",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "80\n",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "WEIGHT",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]))),
                                  Stack(children: <Widget>[
                                    SizedBox(height: 60),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 35, right: 20),
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
                                                                        FourTabss()));
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons
                                                                    .trending_up,
                                                                size: 30,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ],
                                                          ))))),
                                          PopupMenuButton<PageEnum>(
                                              onSelected: _onSelect,
                                              child: Icon(
                                                Icons.menu,
                                                color: Colors.white,
                                              ),
                                              itemBuilder: (context) =>
                                                  <PopupMenuEntry<PageEnum>>[
                                                    PopupMenuItem<PageEnum>(
                                                      value: PageEnum.firstPage,
                                                      child: Text(
                                                          "Create Profile Details"),
                                                    ),
                                                    PopupMenuItem<PageEnum>(
                                                      value:
                                                          PageEnum.secondPage,
                                                      child:
                                                          Text("Edit Picture"),
                                                    ),
                                                  ]),
                                        ],
                                      ),
                                    )
                                  ]),
                                  Stack(children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: 420,
                                          right: 10,
                                          left: 220,
                                        ),
                                        child: RadarChart(
                                          maxHeight: 200,
                                          labelColor: Colors.white,
                                          strokeColor:
                                              Colors.grey.withOpacity(0.1),
                                          values: [85, 90, 80, 60, 80, 72],
                                          labels: [
                                            "Kick",
                                            "Pass",
                                            "Curve",
                                            "Stamina",
                                            "Jump",
                                            "Speed",
                                          ],
                                          maxValue: 100,
                                          fillColor: Colors.blue,
                                        ))
                                  ]),
                                  Stack(children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, top: 605, right: 10),
                                        child: Container(
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
                                                    Colors.black
                                                        .withOpacity(0.8),
                                                    Colors.black
                                                        .withOpacity(0.75),
                                                    Colors.black
                                                        .withOpacity(0.7),
                                                    Colors.black
                                                        .withOpacity(0.65),
                                                  ]),
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4),
                                                  topRight: Radius.circular(4),
                                                  bottomLeft:
                                                      Radius.circular(4),
                                                  bottomRight:
                                                      Radius.circular(4)),
                                            ),
                                            height: 152,
                                            padding: EdgeInsets.only(
                                                left: 10,
                                                right: 10.0,
                                                bottom: 0),
                                            child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Stack(
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 0,
                                                                  top: 0,
                                                                  right: 0),
                                                          child:
                                                              Stack(children: <
                                                                  Widget>[
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: Colors
                                                                  .black87
                                                                  .withOpacity(
                                                                      0.85),
                                                            )),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 15,
                                                                      top: 20,
                                                                      right:
                                                                          15),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  makeFeed(
                                                                    userName:
                                                                        'Ekachai Ton',
                                                                    userImage:
                                                                        'assets/Ton.jpg',
                                                                    feedTime:
                                                                        '1 hr ago',
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ]))
                                                    ],
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15,
                                                          bottom: 93,
                                                          right: 10),
                                                      child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            likeButton(),
                                                          ]))
                                                ])))
                                  ]),
                                  Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 70),
                                            Row(children: <Widget>[
                                              Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/Flag.jpg"),
                                                          fit: BoxFit.cover))),
                                              Transform.translate(
                                                  offset: Offset(-8, 0),
                                                  child: clubFlag()),
                                            ]),
                                            SizedBox(height: 20),
                                            Text(
                                              valueDataUsers.length == 0
                                                  ? "Player Name"
                                                  : valueDataUsers[0],
                                              overflow: TextOverflow.fade,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30),
                                            ),
                                            Text(
                                              "ทีมไหน FC",
                                              overflow: TextOverflow.fade,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(height: 150),
                                            Row(children: <Widget>[
                                              Stack(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .center,
                                                  children: <Widget>[
                                                    Container(
                                                        width: 35,
                                                        height: 35,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1),
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/Shirt.png"),
                                                                fit: BoxFit
                                                                    .cover))),
                                                    Stack(children: <Widget>[
                                                      Text(
                                                        "10",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13),
                                                      ),
                                                    ])
                                                  ]),
                                              Text(
                                                "Midfielder",
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 13),
                                              ),
                                            ]),
                                            Row(children: <Widget>[
                                              Stack(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .center,
                                                  children: <Widget>[
                                                    Container(
                                                        width: 30,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1),
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/foot1.png"),
                                                                fit: BoxFit
                                                                    .cover))),
                                                  ]),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Right Foot",
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 12),
                                              ),
                                            ]),
                                          ])),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 680, left: 20, right: 20),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.transparent),
                                          height: 50,
                                          padding: EdgeInsets.only(
                                              left: 23, right: 23.0),
                                          child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "72\n",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "SPEED",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "85\n",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "KICK",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "90\n",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "PASS",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "80\n",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "CURVE",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "60\n",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "STAM",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: "80\n",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "JUMP",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]))),
                                ]),
                              )),
                        )
                      ]))
            ])));
  }

  Widget makeFeed({userName, userImage, feedTime}) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 85,
      ),
      child: Row(children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(userImage), fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              userName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              feedTime,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      ]),
    );
  }

  Widget clubFlag() {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.transparent, width: 1),
            image: DecorationImage(
                image: AssetImage("assets/Club.jpg"), fit: BoxFit.cover)));
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
          likeCount: 10864,
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
}
