import 'package:crypto_app/enums/state.dart';
import 'package:crypto_app/provider/auth_provider.dart';
import 'package:crypto_app/screens/authentication/registration.dart';
import 'package:crypto_app/screens/homePage/home_page.dart';
import 'package:crypto_app/utils/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
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
              :SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text("Continue to your account",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),),
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
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //Forgot Password Page
                                  },
                                  child: Container(
                                      alignment: Alignment.centerRight,
                                      child:
                                      const Text("Forgot password?")),
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
                                  await model.loginUser(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim());

                                  if(model.state == ViewState.Success){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>HomePage()));
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
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //Navigate to Register Page
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>RegistrationPage()));
                              },
                              child: Text(
                                "Create Account ",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),),
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