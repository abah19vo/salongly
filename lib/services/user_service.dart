import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salongly/app/app.locator.dart';
import 'package:salongly/models/user.dart' as userModel;

class UserService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  userModel.User _user = locator< userModel.User>();

  Future<void> register(userModel.User user) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      )
          .then((userCredential) {
        userCredential.user?.sendEmailVerification();
        users.doc(userCredential.user!.uid).set(user.toJson());
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> login(userModel.User user) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      var fUser = userCredential.user;
      if (fUser != null && fUser.emailVerified) {
        users.doc(fUser.uid).get().then((fireStoreUser) {
          _user = _user.fromJson(fireStoreUser.data() as Map<String, dynamic>);
        });
      } else
        throw Exception('User Is Not Verified');
    } catch (e) {
      throw e;
    }
  }

  Future<void> recoverPassword(userModel.User user) {
    return auth.sendPasswordResetEmail(email: user.email);
  }
}
