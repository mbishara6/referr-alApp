
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/enums/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier{
  ViewState state = ViewState.Idel;
  String message  = "";

  FirebaseAuth auth =FirebaseAuth.instance;
  CollectionReference profileRef = FirebaseFirestore.instance.collection("user");

  loginUser(String? email , String? password ) async {
    state = ViewState.Busy;
    notifyListeners();
    try {
      await auth.signInWithEmailAndPassword(email: email!, password: password! );
      message= "login Success";
      state = ViewState.Success;

    } on FirebaseException catch (e){
      message = e.message.toString();
      state = ViewState.Error;
      notifyListeners();
    }catch(e){
      message = e.toString();
      state =ViewState.Error;

    }


  }


  registerUser(String? email , String? password ) async {
    state = ViewState.Busy;
    notifyListeners();
    try {
      await auth.createUserWithEmailAndPassword(email: email!, password: password! );
      message= "Register Success";
      state = ViewState.Success;

    } on FirebaseException catch (e){
      message = e.message.toString();
      state = ViewState.Error;
      notifyListeners();
    }catch(e){
      message = e.toString();
      state =ViewState.Error;

    }
  }

   createUserProfile() async {
    final body = {
      "refCode": auth.currentUser!.uid,
      "email": auth.currentUser!.uid,
      "date_created": DateTime.now(),
      "referrals":<String>[],
      "refEarning":0,
    };
    await Future.delayed(const Duration(seconds: 2));
    profileRef.add(body);

  }

}