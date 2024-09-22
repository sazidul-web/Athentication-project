import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  // Future<User> signInWithApple({List<Scope> scopes = const []}) async {
  //   final result = await TheAppleSignIn.performRequests(
  //       [AppleIdRequest(requestedScopes: scopes)]);
  //   switch (result.status) {
  //     case AuthorizationStatus.authorized:
  //       final AppleIdCredential = result.credential!;
  //       final oAuthCredential = OAuthProvider('apple.com');
  //       final credential = oAuthCredential.credential(
  //           idToken: String.fromCharCodes(AppleIdCredential.identityToken!));
  //       final UserCredential = await auth.signInWithCredential(credential);
  //       final firebaseUser = UserCredential.user!;
  //       if (scopes.contains(Scope.fullName)) {
  //         final fullName = AppleIdCredential.fullName;
  //         if (fullName != null &&
  //             fullName.givenName != null &&
  //             fullName.familyName != null) {
  //           final displayName = '${fullName.givenName}${fullName.familyName}';
  //           await firebaseUser.updateDisplayName(displayName);
  //         }
  //       }
  //       return firebaseUser;
  //     case AuthorizationStatus.error:
  //       throw PlatformException(
  //           code: 'ERROR_AUTHORIZATION_DENIED',
  //           message: result.error.toString());

  //     case AuthorizationStatus.cancelled:
  //       throw PlatformException(
  //           code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
  //     default:
  //       throw UnimplementedError();
  //   }
  // }
}
