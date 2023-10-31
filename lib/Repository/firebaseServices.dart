import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/authScreens/login_screen.dart';
import '../Screens/consts.dart';
import '../Screens/homeScreen.dart';
class FirebaseAuthServices{
  signUpWithPassword(
      {required context, required email, required password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        mySnackBar(
          context: context, message: 'The password provided is too weak.',
          contentType: ContentType.failure,
        );
      } else if (e.code == 'email-already-in-use') {
        mySnackBar(
          context: context,
          message: 'The account already exists for that email.',
          contentType: ContentType.failure,
        );
      }
    } catch (e) {
      mySnackBar(
        context: context,
        message: e.toString(),
        contentType: ContentType.failure,
      );
    }
  }
  signInWithPassword(
      {required context, required email, required password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomeScreen(),),);
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'Error',
          desc:
          'We Send Verified Email To: ${FirebaseAuth.instance.currentUser!.email} Please Check It to Continue',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red,
        ).show();
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'User Not Found',
            desc: e.message ?? 'No user found for that email.',
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
          break;
        case 'wrong-password':
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Wrong Password',
            desc: e.message ?? 'Wrong password provided for that user.',
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
          break;
        case 'INVALID_LOGIN_CREDENTIALS':
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Invalid Login',
            desc: e.message ?? 'Something went wrong',
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
          break;
        case 'email-already-in-use':
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Email In Use',
            desc: e.message ?? 'Email Already in Use',
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
          break;
        case 'weak-password':
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Weak Password',
            desc: e.message ?? 'Your Password is very weak',
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
          break;
        case 'user-disabled':
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Account Disabled',
            desc: e.message ?? 'Your Account is disabled',
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
          break;
        default:
          print(e.message);
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Something Went Wrong',
            desc: e.message ?? 'Something Went Wrong',
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
          break;
      }
    }
  }
  forgotPassword({required String email,required context})async{
    if(email != "" ){
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        mySnackBar(context: context,
          message: 'We Send you an Email to Reset Your Password Please Check it...',
          contentType: ContentType.success,
        );
      }on FirebaseException catch(e){
        mySnackBar(context: context,
          message: e.message!,
          contentType: ContentType.failure,
        );
      }
    }else{
      mySnackBar(context: context,
        message: "The Email Field Can't be Null Please Enter Your Email And Try Again",
        contentType: ContentType.failure,
      );
    }
  }
}





