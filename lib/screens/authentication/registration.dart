import 'package:crypto_app/screens/authentication/login.dart';
import 'package:crypto_app/screens/authentication/ref_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../enums/state.dart';
import '../../provider/auth_provider.dart';
import '../../utils/message.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});



  @override
 State <RegistrationPage> createState() => _RegistrationPageState();
}

class  _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
          builder: (context, model,child) {
            return model.state == ViewState.Busy ?
            Center(
              child: CircularProgressIndicator(),)
                : SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Create a new account",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(30.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CustomTextField(
                                  _emailController,
                                  hint: 'Email',
                                  password: false,
                                  border: Border.all(color:Colors.black),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  _passwordController,
                                  hint: 'Password',
                                  obscure: true,
                                  border: Border.all(color:Colors.black),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  _passwordController,
                                  hint: 'Password',
                                  obscure: true,
                                  border: Border.all(color:Colors.black),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () async {
                                if(_emailController.text.isEmpty){
                                  showMessage(context, "All fields are required ");
                                }else{
                                  await model.registerUser(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim());

                                  if(model.state == ViewState.Success){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>
                                            RefPage()));
                                  }else{
                                    showMessage(context, model.message);
                                  }
                                }

                                //Validate User Inputs
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //Navigate to Register Page
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>LoginPage()));
                                // Navigator.push(
                                //     context,CupertinoPageRoute(
                                //     builder: (context)=>LoginPage()));
                              },
                              child: Text(
                                "Already have an account",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

