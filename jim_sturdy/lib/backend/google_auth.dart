
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential?> _signIntoFirebaseAuth(
    GoogleSignInAccount googleUser) async {
  try {
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  } on Exception catch (e) {
    print('exception: $e');
  }

  return null;
}

Future<UserCredential?> tryToRememberSignInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signInSilently();
  if (googleUser == null) return null;

  return _signIntoFirebaseAuth(googleUser);
}

Future<UserCredential?> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  return _signIntoFirebaseAuth(googleUser!);
}

Future<bool> signOutFromGoogle() async {
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } on Exception catch (_) {
    return false;
  }
}
