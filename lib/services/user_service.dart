import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salongly/models/user.dart' as userModel;

class UserService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  userModel.User user = userModel.User();

  Future<void> register(userModel.User _user) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _user.email,
        password: _user.password,
      )
          .then((userCredential) {
        userCredential.user?.sendEmailVerification();
        users.doc(userCredential.user!.uid).set(_user.toJson());
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> login(userModel.User _user) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: _user.email,
        password: _user.password,
      );

      var fUser = userCredential.user;
      if (fUser != null && fUser.emailVerified) {
        users.doc(fUser.uid).get().then((fireStoreUser) {
          user = user.fromJson(fireStoreUser.data() as Map<String, dynamic>);
        });
      } else
        throw Exception('User Is Not Verified');
    } catch (e) {
      throw e;
    }
  }

  Future<void> recoverPassword(userModel.User _user) {
    return auth.sendPasswordResetEmail(email: _user.email);
  }
}
