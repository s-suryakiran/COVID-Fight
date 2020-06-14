import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
class SignIn extends StatelessWidget {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final GoogleSignIn googleSignIn=new GoogleSignIn();
  Future<FirebaseUser> _signIn() async{
    GoogleSignInAccount googleSignInAccount=await googleSignIn.signIn();
    GoogleSignInAuthentication gSA=await googleSignInAccount.authentication;
    AuthCredential credential =GoogleAuthProvider.getCredential(idToken: gSA.idToken,   accessToken: gSA.accessToken);
    FirebaseUser user=(await _auth.signInWithCredential(credential)).user;
    print("una: ${user.displayName}");

    return user;
  }
  void signOut(){
    googleSignIn.signOut();
    print("user signed out");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: ()=>_signIn().then((FirebaseUser user)=>print(user)).catchError((onError)=>print(onError)),child: Text("Sign In"),),
            RaisedButton(onPressed: ()=>signOut(),child: Text("Sign Out"),),

          ],
        ),
      ),
    );
  }
}
