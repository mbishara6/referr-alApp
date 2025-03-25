import 'package:crypto_app/provider/ref_pageProvider.dart';
import 'package:crypto_app/screens/homePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../enums/state.dart';
import '../../utils/message.dart';



class RefPage extends StatelessWidget {
   RefPage({super.key});
  final TextEditingController _refController = TextEditingController();
 // final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Consumer<RefProvider>(
        builder: (context, model,child)
    {
      return model.state == ViewState.Busy ?
      Center(
        child: CircularProgressIndicator(),)
          : SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(color: Colors.blue),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Enter referral code",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(30.0),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
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
                              _refController,
                              hint: 'Referral Code ',
                              password: false,
                              border: Border.all(color: Colors.blueAccent),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                          ],
                        ),
                        GestureDetector(
                          onTap: () {

                            //Validate User Inputs
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if(_refController.text.isEmpty){
                              showMessage(context, "All fields are required ");
                            }else{
                              await model.setReferral(
                                  _refController.text.trim(),);

                              if(model.state == ViewState.Success){
                                  if (context.mounted) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => const HomePage()),
                                          (route) => false,
                                    );

                                } else {
                                  if (context.mounted) { // Check before showMessage
                                    showMessage(context, model.message);
                                  }
                                }
                                // Navigator.pushAndRemoveUntil(context,
                                //     MaterialPageRoute(builder: (context)=>
                                //     const HomePage()),(route)=>false  );
                              }else{
                                showMessage(context, model.message);
                              }
                            }

                          },
                          child: Text(
                            "No referral? continue",
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
    },
      ),
    );
  }
}
