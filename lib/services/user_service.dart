import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salongly/models/user.dart' as userModel;

class UserService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  userModel.User user = userModel.User();

  register(userModel.User _user) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _user.email,
        password: _user.password,
      )
          .then((userCredential) {
        users.add(_user.toJson());
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
