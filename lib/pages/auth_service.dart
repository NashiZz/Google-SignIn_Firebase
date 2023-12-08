import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  
  void signInwithGoogle() async {
    try {
      print("Hi Google Login");
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      // begin interactive sign in process
      final GoogleSignIn gSn = GoogleSignIn();
      final GoogleSignInAccount? gAcc = await gSn.signIn();

      if (gAcc != null) {
        final GoogleSignInAuthentication gAuth = await gAcc.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );

        try {
          final UserCredential userCredential = await auth.signInWithCredential(credential);
          user = userCredential.user;
          print(user?.email);
          print(user?.displayName);

        }on FirebaseAuthException catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print(e);
    }

    // obtaiin auth details from request
    

    //create new credential for user
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: gAuth.accessToken,
    //   idToken: gAuth.idToken,
    // );

    //lets sign in
    // UserCredential userCredential =
    //     await FirebaseAuth.instance.signInWithCredential(credential);
    // print(gUser.email);
    // print(gUser.displayName);
  }
}

