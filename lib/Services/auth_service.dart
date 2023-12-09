import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:github_sign_in_plus/github_sign_in_plus.dart';

class AuthService {
  signInWithGoogle() async {
    final GoogleSignInAccount? gUser2 = await GoogleSignIn(clientId: '586118175285-v9g7opqlbd9q4r3ktill4bh4uimq3r06.apps.googleusercontent.com').signOut();
    final GoogleSignInAccount? gUser = await GoogleSignIn(clientId: '586118175285-v9g7opqlbd9q4r3ktill4bh4uimq3r06.apps.googleusercontent.com').signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    print(loginResult.accessToken);
    print('Facebook login failed. Status: ${loginResult.status}, Error: ${loginResult.message}');
    final OAuthCredential facebookCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return await FirebaseAuth.instance.signInWithCredential(facebookCredential);
  }
  signInWithGithub(BuildContext context) async {
    final result = await GitHubSignIn(
      clientId: '9b52207f7425948065ae',
      clientSecret: '38bcbca56a2f39466516dd98832de2cedf632441',
      redirectUrl: 'https://authentication-mbapp.firebaseapp.com/__/auth/handler',
      title: 'SDN-Project',
      centerTitle: false,
    ).signIn(context);
    final AuthCredential credential = GithubAuthProvider.credential(result.token!);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}