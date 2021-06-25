import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:musopathy/widgets/custom_drawer.dart';
import 'package:musopathy/widgets/upperUI.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<ScaffoldState> key2 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      key: key2,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(40, 115, 161, 1.0)),
        backgroundColor: Colors.white,
        title: Text(
          'Contact Us',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 20,
            color: Color.fromRGBO(40, 115, 161, 1.0),
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            UpperUI(),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: GestureDetector(
                onTap: () async {
                  Email email = Email(
                    body: 'Email body',
                    subject: 'Email subject',
                    recipients: ['Wellness@musopathy.com'],
                    isHTML: false,
                  );

                  await FlutterEmailSender.send(email);
                },
                child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      // height: 300,
                      //     width: 400,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.blue.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "For Queries Contact",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 20),
                            ),
                            Text(
                              "Musopathy Foundation",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 18),
                            ),
                            Text(
                              "Email: Wellness@musopathy.com",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 18),
                            ),
                            Text(
                              "Phone/whatsapp: +91 9663378987",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ]),
        ),
      ),
    );
  }
}
