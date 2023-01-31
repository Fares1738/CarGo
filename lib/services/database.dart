import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //Collection Reference

  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference carCollection =
      FirebaseFirestore.instance.collection('cars');

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('user');

//to Store the registered user information so later it can be modified
  Future updateUserData(
      String userFullname, String userEmail, String userPassword) async {
    return await usersCollection.doc(uid).set({
      'userFullname': userFullname,
      'userEmail': userEmail,
      'userPassword': userPassword,
    });
  }
}
