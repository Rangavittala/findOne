import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:musopathy/models/data.dart';
import 'package:provider/provider.dart';

class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController _email = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Form(
        key: _formkey,
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 16, right: 25, bottom: 16),
                child: TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "enter email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "something@example.com")),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.15,
                  height: 55,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                    onPressed: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      if (_formkey.currentState.validate()) {
                        try {
                          await _auth.sendPasswordResetEmail(
                              email: _email.text.trim());
                          Fluttertoast.showToast(
                              msg: "success", toastLength: Toast.LENGTH_LONG);
                        } catch (e) {
                          Fluttertoast.showToast(
                              msg: "$e", toastLength: Toast.LENGTH_LONG);
                        }
                        Provider.of<Data>(context, listen: false).pwreset();
                      }
                    },
                    child: Text(
                      "Enter",
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: Color.fromRGBO(40, 115, 161, 1.0),
                        onPrimary: Colors.white),
                  ),
                ),
              ),
              Text(
                "we will send you the password reset link on your email",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(40, 115, 161, 1.0), fontSize: 20.0),
              )
            ])));
  }
}
