import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  // Field
  File file;
  String uidLogin, urlImage;

  // Method

  Future<void> getPhoto(ImageSource imageSource) async {
    var image = await ImagePicker.pickImage(
        source: imageSource, maxWidth: 800.0, maxHeight: 600.0);

    setState(() {
      file = image;
    });
  }

  Widget cameraButton() {
    return RaisedButton.icon(
      icon: Icon(Icons.add_a_photo),
      label: Text('Take Photo'),
      onPressed: () {
        getPhoto(ImageSource.camera);
      },
    );
  }

  Widget galleryButton() {
    return RaisedButton.icon(
      icon: Icon(Icons.add_a_photo),
      label: Text('Get Gallery'),
      onPressed: () {
        getPhoto(ImageSource.gallery);
      },
    );
  }

  Widget saveButton() {
    return RaisedButton.icon(
      icon: Icon(Icons.add_a_photo),
      label: Text('Save'),
      onPressed: () {
        if (file != null) {
          uploadImageToStorage();
        } else {
          print('Choose Image First');
        }
      },
    );
  }

  Future<void> uploadImageToStorage() async {
    Random random = Random();
    int myInt = random.nextInt(1000000);
    String nameImage = 'avatar$myInt.jpg';

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    StorageReference storageReference =
        firebaseStorage.ref().child('Avatar/$nameImage');
    StorageUploadTask storageUploadTask = storageReference.putFile(file);

    await (await storageUploadTask.onComplete)
        .ref
        .getDownloadURL()
        .then((result) {
      urlImage = result.toString();
      print('urlImage = $urlImage');
      if (urlImage != null) {
        findUid();
      }
    });
  }

  Future<void> findUid() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser().then((object) {
      uidLogin = object.uid;
      updateAvatarOnFireStore();
    });
  }

  Future<void> updateAvatarOnFireStore() async {
    Map<String, dynamic> map = Map();
    map['PathURL'] = urlImage;

    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Avatar');
    await collectionReference
        .document(uidLogin)
        .setData(map)
        .then((response) {
          Navigator.of(context).pop();
        });
  }

  Widget showButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          children: <Widget>[
            cameraButton(),
            galleryButton(),
            saveButton(),
          ],
        ),
      ],
    );
  }

  Widget showImage() {
    return Center(
      child: file == null ? Text('No Image') : Image.file(file),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Image'),
      ),
      body: Stack(
        children: <Widget>[
          showImage(),
          showButton(),
        ],
      ),
    );
  }
}
