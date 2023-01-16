import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_app/app/models/user_model.dart';
import 'package:responsive_app/app/packages/exception/exception.dart';

class AuthenticationRepository {
  final firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn.standard();

  var currentUser = MyUser.empty;

  Stream<MyUser> get user {
    return firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? MyUser.empty : firebaseUser.toUser;
      currentUser = user;
      return currentUser;
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPassword(e.code);
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPassword(e.code);
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        firebaseAuth.signOut(),
        googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

extension on User {
  MyUser get toUser {
    return MyUser(
      uid: uid,
      name: displayName ?? '',
      email: email,
      photo: photoURL,
      verify: emailVerified,
    );
  }
}
