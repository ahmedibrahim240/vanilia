import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vanillia/model/user.dart';
// import 'package:path/path.dart';

class DatabaseServices {
  final String userId;
  DatabaseServices({this.userId});
  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');
  Future setUserData(String phoneNamber, String name, String email,
      String userImageUrl) async {
    return await userCollection.document(userId).setData(
      {
        'phoneNumber': phoneNamber,
        'name': name,
        'email': email,
        'userImageUrl': userImageUrl,
      },
    ).catchError(
      (e) {
        print(e.toString);
      },
    );
  }

  updateUserData(
      String phoneNamber, String name, String email, String userImageUrl) {
    userCollection.document(userId).updateData(
      {
        'phoneNumber': phoneNamber,
        'name': name,
        'email': email,
        'userImageUrl': userImageUrl,
      },
    ).catchError(
      (e) {
        print(e.toString);
      },
    );
  }

  Users _usersDataFromSnapshot(DocumentSnapshot snapshot) {
    return Users(
      uid: userId,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      phoneNumber: snapshot.data['phoneNumber'],
      userImageUrl: snapshot.data['userImageUrl'],
    );
  }

  Stream<Users> get userData {
    return userCollection
        .document(userId)
        .snapshots()
        .map(_usersDataFromSnapshot);
  }

  getUserByUserName(String username) async {
    return await Firestore.instance
        .collection('users')
        .where('name', isEqualTo: username)
        .getDocuments();
  }

  getUserByUseremail(String useremail) async {
    return await Firestore.instance
        .collection('users')
        .where('email', isEqualTo: useremail)
        .getDocuments();
  }

  Future createChatRoom(String chatRomeId, chatRoomMap) async {
    final CollectionReference chatCollection =
        Firestore.instance.collection('chatrome');
    return await chatCollection
        .document(chatRomeId)
        .setData(chatRoomMap)
        .catchError(
      (e) {
        print(e.toString);
      },
    );
  }

  addConversationMessages(String chatRoomId, messageMap) {
    Firestore.instance
        .collection('chatrome')
        .document(chatRoomId)
        .collection('chat')
        .add(messageMap)
        .catchError(
      (e) {
        print(e.toString);
      },
    );
  }

  getConversationMessages(String chatRoomId) async {
    try {
      // ignore: await_only_futures
      return await Firestore.instance
          .collection('chatrome')
          .document(chatRoomId)
          .collection('chat')
          .orderBy('time', descending: false)
          .snapshots();
    } catch (e) {
      print(e.toString);
    }
  }

  getChatRome(String userName) async {
    // ignore: await_only_futures
    return await Firestore.instance
        .collection('chatrome')
        .where('users', arrayContains: userName)
        .snapshots();
  }
}
