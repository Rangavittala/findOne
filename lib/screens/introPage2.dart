import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:musopathy/models/data.dart';

import 'package:musopathy/screens/languagePage.dart';
import 'package:musopathy/screens/loginUi.dart';
import 'package:musopathy/widgets/BUtton.dart';

import 'package:musopathy/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:connectivity/connectivity.dart';

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  Future<int> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return 1;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return 1;
    }
    return Future.error(
        "This is the error", StackTrace.fromString("This is its trace"));
  }

  WebViewController _controller;

  bool loggedin = false;
  String url =
      "https://player.vimeo.com/video/563210963?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final Future<int> result = checkConnection();
    return SafeArea(
      child: Scaffold(
        key: key,
        drawer: CustomDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromRGBO(40, 115, 161, 1.0)),
          // elevation: 0,
          // bottomOpacity: 0.0,
          // leading: IconButton(
          //     icon: Icon(Icons.menu),
          //     iconSize: 30.0,
          //     color: Theme.of(context).primaryColor,
          //     onPressed: () => key.currentState.openDrawer()),
          // iconTheme: IconThemeData(color: Color.fromRGBO(40, 115, 161, 1.0)),
          // centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'M U S O P A T H Y',
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 20,
              color: Color.fromRGBO(40, 115, 161, 1.0),
              fontWeight: FontWeight.normal,
              //fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 4,
        ),
        // drawer: Drawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LimitedBox(
                maxHeight: 230,
                maxWidth: double.infinity,
                child: FutureBuilder<int>(
                  future:
                      result, // a previously-obtained Future<String> or null
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (snapshot.hasData) {
                      return WebView(
                          initialUrl: url,
                          javascriptMode: JavascriptMode.unrestricted,
                          onWebViewCreated: (WebViewController c) {
                            _controller = c;
                          });
                    } else if (snapshot.hasError) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          Text(
                            "net:: ERR_INTERNET_DISCONNECTED",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            child: Text("Tap to retry once connected"),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Musopathy provides revolutionary tools for individual and organizational Health and Wellness like the Tonation Breathing Techniques (TBT) Program to manage Covid Symptoms, Anxiety and Depression. TBT is a specially evolved program that includes diverse non-strenuous Breathing techniques anchored on published studies by Harvard, Johns Hopkins etc. The special feature is the addition of Tonation through hostrils or lips to most techniques which has enabled hundreds to improve their lung, immunological and psychological health besides increasing focus energy, clarity, decision making abilities and decreasing stress and fatigue.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                ),
              ),
              // SizedBox(
              //   height: 20.0,
              // ),
              Button(
                Text(
                              "SignUp/SignIn",
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                
                () {
                  _controller.clearCache();
                  // _controller1.pause();
                  if (Provider.of<Data>(context, listen: false).loggedin ==
                      true) {
                    // return AlertDialog(
                    //   title: const Text('Dear User'),
                    //   content: SingleChildScrollView(
                    //     child: ListBody(
                    //       children: const <Widget>[
                    //         Text('You are already logged in'),
                    //       ],
                    //     ),
                    //   ),
                    //   actions: <Widget>[
                    //     TextButton(
                    //       child: const Text('Okay'),
                    //       onPressed: () {
                    //         Navigator.of(context).pop();
                    //       },
                    //     ),
                    //   ],
                    // );
                    // final snackBar =
                    //     SnackBar(content: Text('You are already logged in!!!'));

                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Fluttertoast.showToast(
                        msg: "You are already loggedin",
                        toastLength: Toast.LENGTH_LONG);
                    // }
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => MyHomePage()));
                  }
                },
              ),
              SizedBox(
                height: 2.0,
              ),
              Button(
                Text(
                              "Exercises",
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                
                () async {
                  await _controller.clearCache();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Language()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
