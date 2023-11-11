import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_app/configs/app_logger.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/widgets/dialogs/dialogue_widget.dart';

class AuthController extends GetxController {

 @override
  void onReady() {
   initAuth() ;
   super.onReady() ;
 }
 late FirebaseAuth _auth ;
 final _user = Rxn<User>() ;
late Stream<User?> _authStateChanges ;
 void initAuth() async {
 await Future.delayed(
     const Duration(seconds: 2)) ;
 _auth = FirebaseAuth.instance ;
 _authStateChanges = _auth.authStateChanges() ;
 _authStateChanges.listen((User? user) {
   _user.value = user ;
   });
  navigateToIntroduction() ;
 }

 signInWithGoogle() async {
  final GoogleSignIn _googleSignIn =  GoogleSignIn() ;
  try{
   GoogleSignInAccount? account = await  _googleSignIn.signIn() ;
   if (account !=null ) {
   final _authAccount = await  account.authentication;
   final _credential =  GoogleAuthProvider.credential(
    idToken: _authAccount.idToken,
    accessToken: _authAccount.accessToken
   );
   await _auth.signInWithCredential(_credential) ;
   await saveUser(account) ;
   Get.toNamed('/home') ;
   }
  } on Exception catch(error){
    AppLogger.e(error) ;
  }
 }
 saveUser(GoogleSignInAccount account)  {
  userRF.doc(account.email).set({
   'email' : account.email ,
   'name' : account.displayName ,
   'profilepic' : account.photoUrl,
  });
}
Future<void> signOut() async {
 AppLogger.d('Sign out ') ;
 try{
  await  _auth.signOut();
  navigateToHomePage() ;
 } on FirebaseAuthException catch (e) {
  AppLogger.e(e);
 }
}
 void navigateToIntroduction(){
    Get.offAllNamed("/introduction") ;
 }
 void navigateToHomePage(){
  Get.offAllNamed("/home") ;
 }
 void showLoginAlertDialogue(){
   Get.dialog(
       Dialogs().questionStartDialogue(onTap: (){
      Get.back() ;
      navigateToLoginPage() ;
   }) ,
   barrierDismissible: false
   ) ;
 }

 void navigateToLoginPage(){
  Get.toNamed('/login') ;
 }

 bool isLoggedIn(){
  return  _auth.currentUser !=null ;
 }
 User? getUser(){
  _user.value = _auth.currentUser ;
  return _user.value ;
 }
}