import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/wrapper/home/home.dart';
import 'package:vanillia/screenes/wrapper/home/menu/settings.dart';
import 'package:vanillia/services/database.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final picker = ImagePicker();
  File _imageFile;
  String _currentphoneNumber;
  String _currentName;
  String _currentImageUrl;

  Future uploadImage(BuildContext context) async {
    String fileName = basename(_imageFile.path);
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('images/$fileName');
    StorageUploadTask uploadTask = storageReference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then((val) {
      print('Dome:$val');
      setState(() {
        _currentImageUrl = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => Home(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Settings(),
                ),
              );
            },
          ),
        ],
        title: Text(
          getTranslated(context, 'profile'),
          style: AppTheme.heading.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder<Users>(
        stream: DatabaseServices(userId: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Users userData = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  proAppBar(width, userData.userImageUrl, context),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 35),
                          child: TextFormField(
                            initialValue: userData.name,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.edit,
                                color: customColor,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: AppTheme.heading.copyWith(
                                color: customColor,
                              ),
                              labelText: getTranslated(context, 'name'),
                            ),
                            onChanged: (val) {
                              setState(() {
                                _currentName = val;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 35),
                          child: TextFormField(
                            initialValue: userData.phoneNumber,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.edit,
                                color: customColor,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: AppTheme.heading.copyWith(
                                color: customColor,
                              ),
                              labelText: getTranslated(context, 'phone_num'),
                            ),
                            onChanged: (val) {
                              setState(() {
                                _currentphoneNumber = val;
                              });
                            },
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       right: 10, left: 10, bottom: 35),
                        //   child: TextFormField(
                        //     initialValue: UserData.pasword,
                        //     decoration: InputDecoration(
                        //       floatingLabelBehavior: FloatingLabelBehavior.always,
                        //       labelStyle: AppTheme.heading.copyWith(
                        //         color: customColor,
                        //       ),
                        //       labelText: getTranslated(context, 'password'),
                        //     ),
                        //     obscureText: true,
                        //     readOnly: true,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            initialValue: userData.email,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 3),
                              labelStyle: AppTheme.heading.copyWith(
                                color: customColor,
                              ),
                              labelText: getTranslated(context, 'email'),
                            ),
                            readOnly: true,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: customColor,
                                child: Text(
                                  getTranslated(context, 'save'),
                                  style: AppTheme.heading.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  await DatabaseServices(userId: user.uid)
                                      .updateUserData(
                                    _currentphoneNumber ?? userData.phoneNumber,
                                    _currentName ?? userData.name,
                                    userData.email,
                                    _currentImageUrl ?? userData.userImageUrl,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.pink[600],
                                  ),
                                ),
                                child: Text(
                                  getTranslated(context, 'cancel'),
                                  style: AppTheme.heading.copyWith(
                                    color: customColor,
                                  ),
                                ),
                                onPressed: () {
                                  DatabaseServices(userId: user.uid)
                                      .updateUserData(
                                    userData.phoneNumber,
                                    userData.name,
                                    userData.email,
                                    userData.userImageUrl,
                                  );

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => Home(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  _loadPicker(ImageSource source, BuildContext context) async {
    // ignore: deprecated_member_use
    File picked = await ImagePicker.pickImage(source: source);
    if (picked != null) {
      _cropImage(picked, context);
    }
    Navigator.of(context).pop();
  }

  _cropImage(File picked, BuildContext context) async {
    File cropped = await ImageCropper.cropImage(
      androidUiSettings: AndroidUiSettings(
        statusBarColor: Colors.red,
        toolbarColor: Colors.red,
        toolbarTitle: "Crop Image",
        toolbarWidgetColor: Colors.white,
      ),
      sourcePath: picked.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
      ],
      maxWidth: 800,
    );
    if (cropped != null) {
      setState(() {
        _imageFile = cropped;
      });
      await uploadImage(context);
    }
  }

  void _showPickOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Pick from Gallery"),
              onTap: () {
                _loadPicker(ImageSource.gallery, context);
              },
            ),
            ListTile(
              title: Text("Take a pictuer"),
              onTap: () {
                _loadPicker(ImageSource.camera, context);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    String labelText,
    String initialValue,
    bool obscureText,
    bool readOnly,
    Function onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 35),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        obscureText: obscureText,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelStyle: AppTheme.heading.copyWith(
            color: customColor,
          ),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.only(bottom: 3),
        ),
      ),
    );
  }

  Widget proAppBar(double width, String userImadge, BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          // color: Colors.amber,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Builder(
                  builder: (context) => Container(
                    height: 80,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: customColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: (width * .4) - 35,
                child: Stack(
                  children: [
                    Hero(
                      tag: 'userImg',
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: (_imageFile != null)
                                  ? Image.file(
                                      _imageFile,
                                      fit: BoxFit.cover,
                                    )
                                  : Image(
                                      image: NetworkImage(
                                        userImadge,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          _showPickOptionsDialog(context);
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: customColor,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
