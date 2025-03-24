import 'package:crypto_app/provider/auth_provider.dart';
import 'package:crypto_app/provider/ref_pageProvider.dart';
import 'package:crypto_app/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 void main  () async {

   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp  extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
        ChangeNotifierProvider(create: (_)=> RefProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
