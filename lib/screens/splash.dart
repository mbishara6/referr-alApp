import 'package:crypto_app/screens/homePage/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState (){
    // To implement InitState
    super.initState();
    navigate();
  }

  FirebaseAuth auth =FirebaseAuth.instance;

  void navigate (){
  Future.delayed(const Duration(seconds: 2),(){
    if(auth.currentUser != null){

    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      // Navigator.push(context,MaterialPageRoute(
      //     builder: (context)=>LoginPage()));
    }
  } );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
