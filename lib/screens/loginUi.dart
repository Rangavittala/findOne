import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:musopathy/fields/signinwidget.dart';
import 'package:musopathy/fields/registerwidget.dart';
import 'package:musopathy/models/data.dart';
import 'package:musopathy/screens/Forgot.dart';
import 'package:musopathy/widgets/custom_drawer.dart';
import 'package:musopathy/widgets/upperUI.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final tabcontroller = new TabController(length: 2, vsync: this);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(40, 115, 161, 1.0)),
        backgroundColor: Colors.white,
        title: Text(
          'M U S O P A T H Y',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 20,
            color: Color.fromRGBO(40, 115, 161, 1.0),
            fontWeight: FontWeight.normal,
          ),
        ),
        elevation: 4,
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              UpperUI(),
              TabBar(
                indicatorColor: Color.fromRGBO(40, 115, 161, 1.0),
                controller: tabcontroller,
                tabs: [
                  Tab(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Color.fromRGBO(40, 115, 161, 1.0),
                          fontSize: 18),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Color.fromRGBO(40, 115, 161, 1.0),
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  Provider.of<Data>(
                            context,
                          ).fpwd ==
                          false
                      ? SignIn()
                      : ForgotScreen(),
                  Register(),
                ],
                controller: tabcontroller,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
