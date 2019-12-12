import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:like_button/like_button.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  var msg;

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.1),
          elevation: 0,
          title: Text(
            'Feed News',
            style: TextStyle(
                fontSize: 20.0, fontFamily: 'Billabong', color: Colors.black),
          ),
          bottom: PreferredSize(
            child: Container(
              height: 1.0,
              color: Colors.grey[800],
            ),
            preferredSize: Size.fromHeight(1.0),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(MdiIcons.commentOutline),
            iconSize: 22.0,
            color: Colors.black,
          ),
          actions: <Widget>[
            Stack(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.notifications),
                    color: Colors.black,
                    iconSize: 25.0,
                    onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    }),
                counter != 0
                    ? Positioned(
                        right: 11,
                        top: 11,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            '$counter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ],
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('post').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                const Text('Loading');
              } else {
                return snapshot.hasData
                    ? showListView(snapshot)
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              } //##############
            }));
  }

  Future<void> readAllData() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('post');
    await collectionReference.snapshots().listen((dataSnapshot) {
      for (var object in dataSnapshot.documents) {
        
      }
    });
  }

  Widget showListView(var snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.documents.length,
      itemBuilder: (context, index) {
        DocumentSnapshot mypost = snapshot.data.documents[index];

        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 10.0, right: 15.0, bottom: 8.0, top: 15),
                child: Row(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        makeFeed(
                          userName: 'KickIt App Admin',
                          userImage: 'assets/Ton.jpg',
                          feedTime: '${mypost['time']}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      '${mypost['image']}',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '${mypost['title']}',
                        overflow: TextOverflow.fade,
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () => Share.share(
                              "https://web.facebook.com/ekachai.sanharn"),
                          iconSize: 20,
                        ),
                        likeButton(),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      '${mypost['subtitle']}',
                      overflow: TextOverflow.fade,
                      maxLines: 99,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 15.0,
                color: Colors.grey.withOpacity(0.4),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget likeButton() {
    return Container(
        width: 60,
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
          likeCount: 956,
          countBuilder: (int count, bool isLiked, String text) {
            var color = isLiked ? Colors.black : Colors.grey;
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

  Widget makeFeed({userName, userImage, feedTime}) {
    return Container(
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
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              feedTime,
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        )
      ]),
    );
  }
}
