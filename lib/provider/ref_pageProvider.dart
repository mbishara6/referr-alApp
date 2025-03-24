import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/enums/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class RefProvider extends ChangeNotifier{
  ViewState state = ViewState.Idel;

  String message = "";

  FirebaseAuth auth =FirebaseAuth.instance;
  CollectionReference profileRef =
  FirebaseFirestore.instance.collection("user");

  setReferral(String refCode) async {
    state = ViewState.Busy;
    notifyListeners();

    try{
      final value = await profileRef.where("refCode", isEqualTo: refCode).get();

      if(value.docs.isEmpty){
        message = "refCode is not available ";
        state = ViewState.Error;
        notifyListeners();
      }else{
        final data = value.docs[0];

        // Get referrals
        List referrals = data.get("referrals");

        referrals.add(auth.currentUser!.email);

        // Update the ref earning
        final body = {
          "referrals":referrals,
          "refEarning":data.get("refEarning") + 500 ,

        };
        await profileRef.doc(data.id).update(body);

        message ="Success";
        state = ViewState.Success;
        notifyListeners();

      }

    }on FirebaseException catch(e){
      message= e.message.toString();
      state = ViewState.Error;
      notifyListeners();



    }
    }
  }
