import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musopathy/models/adduser.dart';
import 'package:musopathy/models/data.dart';
import 'package:musopathy/screens/Forgot.dart';
import 'package:musopathy/screens/Landingpage.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  SignInwidget createState() => SignInwidget();
}

class SignInwidget extends State<SignIn> {
  bool added;
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  // bool forgetpwd = false;

  Future<UserCredential> signInWithGoogle() async {
    var authresult;
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      authresult = await FirebaseAuth.instance.signInWithCredential(credential);
      // UserCredential newUser1 = await signInWithGoogle();
      if (authresult != null) {
        Fluttertoast.showToast(msg: "success", toastLength: Toast.LENGTH_LONG);
        Provider.of<Data>(context, listen: false).login();
        Provider.of<Data>(context, listen: false).verify();
        await Future.delayed(const Duration(seconds: 2), () {});
        if (Provider.of<Data>(context, listen: false).userName != null)
          added = true;
        else
          added = false;
        var user = AddUser(
            authresult.user.displayName,
            false,
            null,
            authresult.user.email,
            authresult.user.photoURL,
            null,
            null,
            null,
            added);
        user.addUser();
        // Provider.of<Data>(context, listen: false).verify();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LandingPage()));
        //  print(email);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "signin failed", toastLength: Toast.LENGTH_LONG);
    } finally {
      setState(() {
        showspinner = false;
      });
    }
    return authresult;
  }

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  bool showspinner = false;
  bool fpwd = false;
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: fpwd == true
          ? ForgotScreen()
          : Form(
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
                      padding: const EdgeInsets.only(
                          left: 25, top: 20, right: 25, bottom: 16),
                      child: TextFormField(
                        controller: _password,
                        obscureText: true,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "enter password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            hintText: "password"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: ElevatedButton(
                          onPressed: () async {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (_formkey.currentState.validate()) {
                              setState(() {
                                showspinner = true;
                              });
                              try {
                                final newUser =
                                    await _auth.signInWithEmailAndPassword(
                                        email: _email.text.trim(),
                                        password: _password.text.trim());

                                if (newUser != null) {
                                  Provider.of<Data>(context, listen: false)
                                      .login();

                                  Fluttertoast.showToast(
                                      msg: "success",
                                      toastLength: Toast.LENGTH_LONG);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => LandingPage()));
                                  //  print(email);

                                }
                              } catch (e) {
                                Fluttertoast.showToast(
                                    msg: "sigin failed",
                                    toastLength: Toast.LENGTH_LONG);
                                _formkey.currentState.reset();
                              } finally {
                                setState(() {
                                  showspinner = false;
                                });
                              }
                            }
                          },
                          child: Text(
                            "Sign In",
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
                    Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: InkWell(
                        onTap: () {
                          Provider.of<Data>(context, listen: false).pwreset();
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Color.fromRGBO(40, 115, 161, 1.0),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Center(
                      child: Text("or Login with"),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          showspinner = true;
                        });
                        Future<UserCredential> usercred = signInWithGoogle();
                      },
                      child: Ink(
                        padding: EdgeInsets.all(6),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/google_logo.png"),
                                      fit: BoxFit.fitWidth),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
