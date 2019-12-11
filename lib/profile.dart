import 'dart:async';

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';

import 'package:image_picker/image_picker.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text(
          "Edit Profile",
          style:  TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body:  EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  @override
  State createState() =>  EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  File avatarImageFile, backgroundImageFile;

  String sex;

  Future getImage(bool isAvatar) async {
    var result = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (isAvatar) {
        avatarImageFile = result;
      } else {
        backgroundImageFile = result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;

    return  SingleChildScrollView(
      child:  Column(
        children: <Widget>[
           Container(
            child:  Stack(
              children: <Widget>[
                // Background

                (backgroundImageFile == null)
                    ?  Image.asset(
                        'assets/unknow.jpg',
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      )
                    :  Image.file(
                        backgroundImageFile,
                        width: double.infinity,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),

                // Button change background

                 Positioned(
                  child:  Material(
                    child:  IconButton(
                      icon:  Image.asset(
                        'assets/camera.png',
                        width: 30.0,
                        height: 30.0,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () => getImage(false),
                      padding:  EdgeInsets.all(0.0),
                      highlightColor: Colors.black,
                      iconSize: 30.0,
                    ),
                    borderRadius:
                         BorderRadius.all( Radius.circular(30.0)),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  right: 5.0,
                  top: 5.0,
                ),

                // Avatar and button

                 
              ],
            ),
            width: double.infinity,
            height: 200.0,
          ),
           Column(
            children: <Widget>[
              // Username

               Container(
                child:  Text(
                  'Profile Name',
                  style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black87),
                ),
                margin:  EdgeInsets.only(left: 10.0, bottom: 5.0, top: 10.0),
              ),

               Container(
                child:  TextFormField(
                  decoration:  InputDecoration(
                      hintText: 'Name of the player on display',
                      border:  UnderlineInputBorder(),
                      contentPadding:  EdgeInsets.all(5.0),
                      hintStyle:  TextStyle(color: Colors.grey)),
                ),
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
              ),

              // Country

               Container(
                child:  Text(
                  'Country',
                  style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black87),
                ),
                margin:  EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
              ),

               Container(
                child:  TextFormField(
                  decoration:  InputDecoration(
                      hintText: 'Country of your flag on display',
                      border:  UnderlineInputBorder(),
                      contentPadding:  EdgeInsets.all(5.0),
                      hintStyle:  TextStyle(color: Colors.grey)),
                ),
                margin:  EdgeInsets.only(left: 30.0, right: 30.0),
              ),

              // Address

               Container(
                child:  Text(
                  'Address',
                  style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black87),
                ),
                margin:  EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
              ),

              new Container(
                child: new TextFormField(
                  decoration: new InputDecoration(
                      hintText: '72/8 Moo5 Tubma Rayong Thailand',
                      border: new UnderlineInputBorder(),
                      contentPadding: new EdgeInsets.all(5.0),
                      hintStyle: new TextStyle(color: Colors.grey)),
                ),
                margin: new EdgeInsets.only(left: 30.0, right: 30.0),
              ),

              // About me

              new Container(
                child: new Text(
                  'About me',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black87),
                ),
                margin: new EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
              ),

              new Container(
                child: new TextFormField(
                  decoration: new InputDecoration(
                      hintText: 'Fun, like travel, read book and play PES!!!',
                      border: new UnderlineInputBorder(),
                      contentPadding: new EdgeInsets.all(5.0),
                      hintStyle: new TextStyle(color: Colors.grey)),
                ),
                margin: new EdgeInsets.only(left: 30.0, right: 30.0),
              ),

              // About me

              new Container(
                child: new Text(
                  'Phone',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black87),
                ),
                margin: new EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
              ),

              new Container(
                child: new TextFormField(
                  decoration: new InputDecoration(
                      hintText: '0123456789',
                      border: new UnderlineInputBorder(),
                      contentPadding: new EdgeInsets.all(5.0),
                      hintStyle: new TextStyle(color: Colors.grey)),
                  keyboardType: TextInputType.number,
                ),
                margin: new EdgeInsets.only(left: 30.0, right: 30.0),
              ),

              // Sex

              new Container(
                child: new Text(
                  'Sex',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black87),
                ),
                margin: new EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
              ),

              new Container(
                child: new DropdownButton<String>(
                  items: <String>['Male', 'Female'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      sex = value;
                    });
                  },
                  hint: sex == null
                      ? new Text('Male')
                      : new Text(
                          sex,
                          style: new TextStyle(color: Colors.black),
                        ),
                  style: new TextStyle(color: Colors.black),
                ),
                margin: new EdgeInsets.only(left: 50.0),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )
        ],
      ),
      padding: new EdgeInsets.only(bottom: 20.0),
    );
  }
}
